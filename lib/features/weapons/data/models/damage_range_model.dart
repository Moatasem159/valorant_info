import 'package:valorant_info/features/weapons/domain/entities/damage_range.dart';

class DamageRangeModel extends DamageRange {
  DamageRangeModel({
    required super.rangeStartMeters,
    required super.rangeEndMeters,
    required super.headDamage,
    required super.bodyDamage,
    required super.legDamage,
  });

  factory DamageRangeModel.fromJson(Map<String, dynamic> json) =>
      DamageRangeModel(
        rangeStartMeters: json["rangeStartMeters"] ?? 0,
        rangeEndMeters: json["rangeEndMeters"] ?? 0,
        headDamage: json["headDamage"] ?? 0,
        bodyDamage: json["bodyDamage"] ?? 0,
        legDamage: json["legDamage"] ?? 0,
      );

  static Map<String, dynamic> toJson(DamageRange damageRange) => {
        "rangeStartMeters": damageRange.rangeStartMeters,
        "rangeEndMeters": damageRange.rangeEndMeters,
        "headDamage": damageRange.headDamage,
        "bodyDamage": damageRange.bodyDamage,
        "legDamage": damageRange.legDamage,
      };
}
