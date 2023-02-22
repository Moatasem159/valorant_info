import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_row_details.dart';
class WeaponDetails extends StatelessWidget {
  final Weapon weapon;
  const WeaponDetails({super.key, required this.weapon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.s5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (weapon.shopData!.cost! != 0)
            WeaponRowDetails(
              title: AppStrings.cost.tr(context)!,
              infoNum: "${weapon.shopData!.cost!}",
              isEven: false,
            ),
          WeaponRowDetails(
            title: AppStrings.category.tr(context)!,
            info: weapon.category!,
            isEven: true,
          ),
          if (weapon.weaponStats!.fireRate! != 0)
            WeaponRowDetails(
              title: AppStrings.fireRate.tr(context)!,
              infoNum: "${weapon.weaponStats!.fireRate!}",
              isEven: false,
            ),
          if (weapon.weaponStats!.equipTimeSeconds! != 0)
            WeaponRowDetails(
              title: AppStrings.equipTime.tr(context)!,
              infoNum: "${weapon.weaponStats!.equipTimeSeconds!}",
              isEven: true,
            ),
          if (weapon.weaponStats!.equipTimeSeconds! != 0)
            WeaponRowDetails(
              title: AppStrings.reloadTime.tr(context)!,
              infoNum: "${weapon.weaponStats!.equipTimeSeconds!}",
              isEven: false,
            ),
          if (weapon.weaponStats!.firstBulletAccuracy! != 0)
            WeaponRowDetails(
              title: AppStrings.firstBulletAccuracy.tr(context)!,
              infoNum: "${weapon.weaponStats!.firstBulletAccuracy!}",
              isEven: true,
            ),
          if (weapon.weaponStats!.wallPenetration != '')
            WeaponRowDetails(
              title: AppStrings.walPenetration.tr(context)!,
              info: weapon.weaponStats!.wallPenetration!,
              isEven: false,
            ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
