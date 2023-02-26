import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/skin.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/skin_details_screen_widgets/chroma_widget.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/skin_details_screen_widgets/levels_widget.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_profile.dart';

class BuildSkinDetailsScreenBody extends StatelessWidget {
  final Skin skin;
  const BuildSkinDetailsScreenBody({super.key, required this.skin});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          WeaponProfile(image: skin.displayIcon!, name: skin.displayName!),
          if (skin.chromas!.length != 1) ChromaWidget(chromas: skin.chromas!),
          if (skin.levels!.length != 1) LevelsWidget(levels: skin.levels!)
        ],
      ),
    );
  }
}