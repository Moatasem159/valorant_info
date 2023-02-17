import 'dart:convert';

import 'package:valorant_info/features/weapons/data/models/shop_data_model.dart';
import 'package:valorant_info/features/weapons/data/models/skin_model.dart';
import 'package:valorant_info/features/weapons/data/models/weapon_stats_model.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';

class WeaponModel extends Weapon {
  const WeaponModel({
    super.uuid,
    super.displayName,
    super.category,
    super.defaultSkinUuid,
    super.displayIcon,
    super.weaponStats,
    super.shopData,
    super.skins,
  });

  factory WeaponModel.fromJson(Map<String, dynamic> json) => WeaponModel(
        uuid: json["uuid"] ?? '',
        displayName: json["displayName"] ?? '',
        category: json["category"] ?? '',
        defaultSkinUuid: json["defaultSkinUuid"] ?? '',
        displayIcon: json["displayIcon"] ?? '',
        weaponStats: json["weaponStats"] == null
            ? WeaponStatsModel()
            : WeaponStatsModel.fromJson(json["weaponStats"]),
        shopData: json["shopData"] == null
            ? ShopDataModel()
            : ShopDataModel.fromJson(json["shopData"]),
        skins: json["skins"] == null
            ? []
            : List<SkinModel>.from(
                json["skins"].map((x) => SkinModel.fromJson(x))),
      );

  static Map<String, dynamic> weaponToJson(WeaponModel weaponModel) => {
        "uuid": weaponModel.uuid,
        "displayName": weaponModel.displayName,
        "category": weaponModel.category,
        "defaultSkinUuid": weaponModel.defaultSkinUuid,
        "displayIcon": weaponModel.displayIcon,
        "weaponStats": WeaponStatsModel.toJson(weaponModel.weaponStats!),
        "shopData": ShopDataModel.toJson(weaponModel.shopData!),
        "skins": List<SkinModel>.from(
            weaponModel.skins!.map((x) => SkinModel.toJson(x))),
      };

  static String encode(List<WeaponModel> weapons) => json.encode(
      weapons
          .map<Map<String, dynamic>>((weapon) => WeaponModel.weaponToJson(weapon))
          .toList());

  static List<WeaponModel> decode(String weapons) =>
      (json.decode(weapons) as List<dynamic>)
          .map<WeaponModel>((weapon) => WeaponModel.fromJson(weapon))
          .toList();
}
