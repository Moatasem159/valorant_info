import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_card_image.dart';
class WeaponCard extends StatelessWidget {
  final Weapon weapon;
  const WeaponCard({super.key, required this.weapon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.weaponDetailsRoute,extra: weapon);
      },
      child: Stack(
        children: [
          WeaponCardImage(image: weapon.displayIcon!),
          Positioned(
            bottom: 15,
            left:AppLocalizations.of(context)!.isEnLocale?15:0,
            right: AppLocalizations.of(context)!.isEnLocale?0:15,
            child: Text(
              weapon.displayName!,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: FontSize.s18,color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}