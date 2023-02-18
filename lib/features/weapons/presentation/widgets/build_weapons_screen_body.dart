import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapons_screen_appbar.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapons_screen_list.dart';
class BuildWeaponsScreenBody extends StatelessWidget {
  final List<Weapon> weapons;
  const BuildWeaponsScreenBody({super.key,required this.weapons});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const WeaponsScreenAppBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: WeaponsList(weapons: weapons),
      ),
    );
  }
}