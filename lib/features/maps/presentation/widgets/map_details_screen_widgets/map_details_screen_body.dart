import 'package:flutter/material.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_details_screen_widgets/build_map_details_screen_body.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_details_screen_widgets/map_screen_app_bar.dart';
class MapDetailsScreenBody extends StatelessWidget {
  final MapEntity map;
  const MapDetailsScreenBody({super.key, required this.map});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MapDetailsScreenAppBar(map: map),
        body: BuildMapDetailsScreenBody(map: map),
      ),
    );
  }
}