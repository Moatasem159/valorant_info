import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_skins_widgets/skins_list.dart';
class WeaponSkins extends StatelessWidget {
  final Weapon weapon;
  const WeaponSkins({Key? key, required this.weapon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.skins,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: FontSize.s24),
        ),
        SkinsList(weapon: weapon),
      ],
    );
  }
}