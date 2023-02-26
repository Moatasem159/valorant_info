import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_card_image.dart';
class SkinCard extends StatelessWidget {
  final Weapon weapon;
  final int index;
  const SkinCard({super.key, required this.weapon, required this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>GoRouter.of(context).pushNamed(
          Routes.skinsDetailsScreenRoute,
          extra:weapon.skins![index]),
      child: Stack(
        children: [
          WeaponCardImage(image: _image(weapon, index)),
          Positioned(
            bottom:10,
            left:AppLocalizations.of(context)!.isEnLocale?10:0,
            right: AppLocalizations.of(context)!.isEnLocale?0:10,
            child: Text(
              weapon.skins![index].displayName!,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: FontSize.s18,
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
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