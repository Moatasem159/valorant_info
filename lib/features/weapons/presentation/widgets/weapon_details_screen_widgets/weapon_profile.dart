import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_image.dart';
class WeaponProfile extends StatelessWidget {
  final String image;
  final String name;
  const WeaponProfile({super.key, required this.image, required this.name,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(image!='')
        WeaponImage(image: image),
        FittedBox(
          child: Container(
            margin: const EdgeInsets.all(AppPadding.s8),
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: FontSize.s24),
            ),
          ),
        ),
      ],
    );
  }
}