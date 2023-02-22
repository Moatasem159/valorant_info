import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/domain/repositories/weapon_repository.dart';
class GetWeaponsUseCase {
  final WeaponRepository _weaponRepository;
  GetWeaponsUseCase(this._weaponRepository);
  Future<Either<Failure, List<Weapon>>> call(String lang) async {
    return await _weaponRepository.getWeapons(lang);
  }
}