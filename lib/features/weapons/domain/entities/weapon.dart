import 'package:equatable/equatable.dart';
import 'package:valorant_info/features/weapons/domain/entities/shop_data.dart';
import 'package:valorant_info/features/weapons/domain/entities/skin.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapons_stats.dart';

class Weapon extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? category;
  final String? defaultSkinUuid;
  final String? displayIcon;
  final WeaponStats? weaponStats;
  final ShopData? shopData;
  final List<Skin>? skins;

  const Weapon({
    this.uuid,
    this.displayName,
    this.category,
    this.defaultSkinUuid,
    this.displayIcon,
    this.weaponStats,
    this.shopData,
    this.skins,
  });

  @override
  List<Object?> get props => [
    uuid,
    displayName,
    category,
    defaultSkinUuid,
    displayIcon,
    weaponStats,
    shopData,
    skins,
  ];
}
