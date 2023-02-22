import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
abstract class WeaponRepository{
  Future<Either<Failure,List<Weapon>>> getWeapons(String lang);
}