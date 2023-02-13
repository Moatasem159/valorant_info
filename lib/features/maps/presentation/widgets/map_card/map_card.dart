import 'package:flutter/material.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_card/map_card_details.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_card/map_card_image.dart';
class MapCard extends StatelessWidget {
  final MapEntity map;
  const MapCard({super.key, required this.map});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        MapCardImage(map: map),
        MapCardDetails(map: map),
      ],
    );
  }
}