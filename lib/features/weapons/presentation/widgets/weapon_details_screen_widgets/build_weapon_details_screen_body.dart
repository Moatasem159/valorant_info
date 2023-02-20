import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_details.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_damage_ranges.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_profile.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_shop_image.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_skins_widgets/weapon_skins.dart';
class BuildWeaponDetailsScreenBody extends StatelessWidget {
  final Weapon weapon;
  const BuildWeaponDetailsScreenBody({super.key,required this.weapon});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          WeaponProfile(weapon: weapon),
          WeaponDetails(weapon: weapon),
          if (weapon.shopData!.newImage != '')
            WeaponShopImage(image: weapon.shopData!.newImage!),
          if (weapon.weaponStats!.damageRanges!.isNotEmpty)
            WeaponDamageRanges(damageRanges: weapon.weaponStats!.damageRanges!),
          WeaponSkins(weapon: weapon)
        ],
      ),
    );
  }
}