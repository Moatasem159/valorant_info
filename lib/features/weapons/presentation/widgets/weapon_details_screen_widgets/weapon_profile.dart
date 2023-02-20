import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_image.dart';
class WeaponProfile extends StatelessWidget {
  final Weapon weapon;
  const WeaponProfile({super.key, required this.weapon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeaponImage(image: weapon.displayIcon!),
        Text(
          weapon.displayName!,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: FontSize.s24),
        ),
      ],
    );
  }
}