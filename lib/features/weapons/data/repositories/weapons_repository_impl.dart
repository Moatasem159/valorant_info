import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/exceptions.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/core/network/network_info.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/weapons/data/datasources/weapons_local_datasource.dart';
import 'package:valorant_info/features/weapons/data/datasources/weapons_remote_datasource.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/domain/repositories/weapon_repository.dart';
class WeaponRepositoryImpl implements WeaponRepository {
  final WeaponsLocalDataSource _weaponsLocalDataSource;
  final WeaponsRemoteDataSource _weaponsRemoteDataSource;
  final NetworkInfo _networkInfo;
  WeaponRepositoryImpl(this._weaponsLocalDataSource, this._weaponsRemoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, List<Weapon>>> getWeapons() async {
    List<Weapon> cachedWeapons =
        await _weaponsLocalDataSource.getWeaponsFromSharedPref();
    if (cachedWeapons.isNotEmpty) {
      return right(cachedWeapons);
    } else {
      if (await _networkInfo.isConnected) {
        try {
          final List<Weapon> result =
              await _weaponsRemoteDataSource.getWeapons();
          await _weaponsLocalDataSource.saveWeaponsInSharedPref(
              weapons: result);
          return Right(result);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }
      } else {
        return left(const ServerFailure(AppStrings.noInternetConnection));
      }
    }
  }
}
