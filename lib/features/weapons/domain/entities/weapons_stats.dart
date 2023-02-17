import 'package:valorant_info/features/weapons/domain/entities/damage_range.dart';

class WeaponStats{
  final num ?fireRate;
  final num? runSpeedMultiplier;
  final num ?equipTimeSeconds;
  final num ?reloadTimeSeconds;
  final num ?firstBulletAccuracy;
  final String ?wallPenetration;
  final List<DamageRange> ?damageRanges;

  WeaponStats(
      {this.fireRate,
      this.runSpeedMultiplier,
      this.equipTimeSeconds,
      this.reloadTimeSeconds,
      this.firstBulletAccuracy,
      this.wallPenetration,
      this.damageRanges});
}
