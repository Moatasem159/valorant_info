import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_image.dart';
class WeaponShopImage extends StatelessWidget {
  const WeaponShopImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
         AppStrings.imageInShop.tr(context)!,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: FontSize.s24),
        ),
        WeaponImage(image: image)
      ],
    );
  }
}