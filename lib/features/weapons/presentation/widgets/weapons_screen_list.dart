import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_card.dart';
class WeaponsList extends StatelessWidget {
  final List<Weapon> weapons;
  const WeaponsList({super.key,required this.weapons});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: weapons.length,
      itemBuilder: (context, index) =>
          WeaponCard(weapon: weapons[index]),
    );
  }
}