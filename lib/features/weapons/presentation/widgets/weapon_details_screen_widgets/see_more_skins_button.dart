import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
class SeeMoreButton extends StatelessWidget {
  final Weapon weapon;
  const SeeMoreButton({super.key,required this.weapon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap:()=>GoRouter.of(context).pushNamed(Routes.skinsScreenRoute,extra:weapon),
              borderRadius: BorderRadius.circular(AppRadius.s10),
              child: Container(
                  margin: const EdgeInsets.all(AppPadding.s8),
                  padding: const EdgeInsets.all(AppPadding.s8),
                  child: Text(
                    AppStrings.seeMoreSkins.tr(context)!,
                    style: Theme.of(context).textTheme.labelLarge,
                  )),
            ),
            const SizedBox(width: 10,),
          ],
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}