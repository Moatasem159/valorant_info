import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_skins_widgets/skin_card.dart';
class SkinsList extends StatelessWidget {
  final Weapon weapon;
  const SkinsList({super.key,required this.weapon});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.5,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.88, keepPage: false),
        scrollDirection: Axis.horizontal,
        itemCount: weapon.skins!.length>10?10:weapon.skins!.length,
        itemBuilder: (context, index) {
          return SkinCard(weapon: weapon,index: index,);
        },
      ),
    );
  }
}