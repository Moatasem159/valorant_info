import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/core/widgets/app_appbar.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/skins_screen_widgets/build_skins_screen_body.dart';

class SkinsScreenBody extends StatelessWidget {
  final Weapon weapon;
  const SkinsScreenBody({super.key, required this.weapon});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(title: AppStrings.skins),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: BuildSkinsScreenBody(weapon: weapon),
        ));
  }
}