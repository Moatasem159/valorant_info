import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/exceptions.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/core/network/network_info.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/maps/data/datasources/map_remote_datasource.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/domain/repositories/map_repository.dart';

class MapRepositoryImpl implements MapRepository{
  final MapsRemoteDataSource _mapsRemoteDataSource;
  final NetworkInfo _networkInfo;
  MapRepositoryImpl(this._mapsRemoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, List<MapEntity>>> getMaps() async{
    if(await _networkInfo.isConnected) {
      try{
        final List<MapEntity> result=await _mapsRemoteDataSource.getMaps();
        return Right(result);
      }on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
}