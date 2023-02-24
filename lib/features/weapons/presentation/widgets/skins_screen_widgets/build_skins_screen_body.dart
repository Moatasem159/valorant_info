import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_skins_widgets/skin_card.dart';
class BuildSkinsScreenBody extends StatelessWidget {
  final Weapon weapon;
  const BuildSkinsScreenBody({super.key, required this.weapon});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: weapon.skins!.length,
        itemBuilder: (context, index) => SkinCard(weapon: weapon, index: index));
  }
}
