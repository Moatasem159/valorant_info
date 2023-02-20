import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_card_image.dart';
class SkinCard extends StatelessWidget {
  final Weapon weapon;
  final int index;
  const SkinCard({super.key, required this.weapon, required this.index});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeaponCardImage(image: _image(weapon, index)),
        Positioned(
          bottom: 20,
          left: 15,
          child: Text(
            weapon.skins![index].displayName!,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: FontSize.s18, color: Colors.white),
          ),
        ),
      ],
    );
  }
  String _image(Weapon weapon, int index) {
    if (weapon.skins![index].chromas![0].displayName == weapon.displayName) {
      return weapon.displayIcon!;
    } else if (weapon.skins![index].displayIcon != "") {
      return weapon.skins![index].displayIcon!;
    } else {
      return weapon.skins![index].chromas![0].fullRender!;
    }
  }
}