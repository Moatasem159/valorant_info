import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/level.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/video_player.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_profile.dart';

class LevelDetails extends StatelessWidget {
  final Level selectedLevel;
  const LevelDetails({super.key, required this.selectedLevel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeaponProfile(
          image: selectedLevel.displayIcon!,
          name: selectedLevel.displayName!,
        ),
        VideoPlayerWidget(link:selectedLevel.streamedVideo!),
      ],
    );
  }
}