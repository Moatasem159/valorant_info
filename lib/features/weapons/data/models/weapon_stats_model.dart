import 'package:valorant_info/features/weapons/data/models/damage_range_model.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapons_stats.dart';

class WeaponStatsModel extends WeaponStats {
  WeaponStatsModel({
    super.fireRate,
    super.runSpeedMultiplier,
    super.equipTimeSeconds,
    super.reloadTimeSeconds,
    super.firstBulletAccuracy,
    super.wallPenetration,
    super.damageRanges,
  });

  factory WeaponStatsModel.fromJson(Map<String, dynamic> json) =>
      WeaponStatsModel(
        fireRate: json["fireRate"] ?? 0,
        runSpeedMultiplier: json["runSpeedMultiplier"] ?? 0,
        equipTimeSeconds: json["equipTimeSeconds"] ?? 0,
        reloadTimeSeconds: json["reloadTimeSeconds"] ?? 0,
        firstBulletAccuracy: json["firstBulletAccuracy"] ?? 0,
        wallPenetration: json["wallPenetration"] ?? "",
        damageRanges: json["damageRanges"] == null
            ? []
            : List<DamageRangeModel>.from(
                json["damageRanges"].map((x) => DamageRangeModel.fromJson(x))),
      );

  static Map<String, dynamic> toJson(WeaponStats weaponStats) => {
        "fireRate": weaponStats.fireRate,
        "runSpeedMultiplier": weaponStats.runSpeedMultiplier,
        "equipTimeSeconds": weaponStats.equipTimeSeconds,
        "reloadTimeSeconds": weaponStats.reloadTimeSeconds,
        "firstBulletAccuracy": weaponStats.firstBulletAccuracy,
        "wallPenetration": weaponStats.wallPenetration,
        "damageRanges":weaponStats.damageRanges==null?[]:List<dynamic>.from(
            weaponStats.damageRanges!.map((x) => DamageRangeModel.toJson(x))),
      };
}
