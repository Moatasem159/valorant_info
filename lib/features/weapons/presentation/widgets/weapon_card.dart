import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_image.dart';
class WeaponCard extends StatelessWidget {
  final Weapon weapon;
  const WeaponCard({super.key, required this.weapon});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeaponImage(image: weapon.displayIcon!),
        Positioned(
          bottom: 15,
          left: 15,
          child: Text(
            weapon.displayName!,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: FontSize.s18),
          ),
        ),
      ],
    );
  }
}