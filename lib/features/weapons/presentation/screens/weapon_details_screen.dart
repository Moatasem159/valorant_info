import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/build_weapon_details_screen_body.dart';
class WeaponDetailsScreen extends StatelessWidget {
  final Weapon weapon;
  const WeaponDetailsScreen({Key? key, required this.weapon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor:Theme.of(context).colorScheme.background,
        body: BuildWeaponDetailsScreenBody(weapon: weapon),
      ),
    );
  }
}