import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/skin.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/skin_details_screen_widgets/skin_details_screen_body.dart';
class SkinDetailsScreen extends StatelessWidget {
  final Skin skin;
  const SkinDetailsScreen({Key? key, required this.skin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SkinDetailsScreenBody(skin:skin);
  }
}