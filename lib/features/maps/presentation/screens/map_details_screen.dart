import 'package:flutter/material.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_details_screen_widgets/map_details_screen_body.dart';
class MapDetailsScreen extends StatelessWidget {
  final MapEntity map;
  const MapDetailsScreen({Key? key, required this.map}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MapDetailsScreenBody(map: map);
  }
}