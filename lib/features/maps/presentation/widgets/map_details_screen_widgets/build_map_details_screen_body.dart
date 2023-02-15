import 'package:flutter/material.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_card/map_card_image.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_details_screen_widgets/map_info.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_details_screen_widgets/map_mini_map.dart';
class BuildMapDetailsScreenBody extends StatelessWidget {
  final MapEntity map;
  const BuildMapDetailsScreenBody({super.key, required this.map});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MapInfo(map: map),
        MapCardImage(map: map),
        if (map.displayIcon != '')
          MapMiniMap(map: map),
      ],
    );
  }
}