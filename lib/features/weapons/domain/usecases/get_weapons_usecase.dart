import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/domain/repositories/weapon_repository.dart';
class GetAgentsUseCase {
  final WeaponRepository _weaponRepository;
  GetAgentsUseCase(this._weaponRepository);
  Future<Either<Failure, List<Weapon>>> call() async {
    return await _weaponRepository.getWeapons();
  }
}