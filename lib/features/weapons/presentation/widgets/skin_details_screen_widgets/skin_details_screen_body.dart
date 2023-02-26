import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/skin.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/skin_details_screen_widgets/build_skin_details_screen_body.dart';
class SkinDetailsScreenBody extends StatelessWidget {
  final Skin skin;
  const SkinDetailsScreenBody({super.key, required this.skin});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(),
        body: BuildSkinDetailsScreenBody(skin: skin),
      ),
    );
  }
}