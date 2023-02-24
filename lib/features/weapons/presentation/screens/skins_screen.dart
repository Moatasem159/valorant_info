import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/skins_screen_widgets/skins_screens_body.dart';
class SkinsScreen extends StatelessWidget {
  final Weapon weapon;
  const SkinsScreen({Key? key, required this.weapon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SkinsScreenBody(weapon: weapon);
  }
}