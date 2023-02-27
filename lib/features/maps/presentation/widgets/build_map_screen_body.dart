import 'package:flutter/material.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_card/map_card.dart';
class BuildMapScreenBody extends StatelessWidget {
  final List<MapEntity> maps;
  const BuildMapScreenBody({super.key,required this.maps,});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: maps.map((e) => MapCard(map: e)).toList(),
        ),
      ),
    );
  }
}