import 'package:flutter/material.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/presentation/widgets/build_map_screen_body.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_screen_appbar.dart';

class MapScreenBody extends StatelessWidget {
  final List<MapEntity> maps;
  const MapScreenBody({super.key, required this.maps});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const MapScreenAppBar(),
          body:BuildMapScreenBody(maps: maps)
        )
    );
  }
}




