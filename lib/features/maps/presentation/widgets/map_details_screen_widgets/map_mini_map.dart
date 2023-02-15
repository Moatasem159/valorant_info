import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
class MapMiniMap extends StatelessWidget {
  final MapEntity map;
  const MapMiniMap({super.key, required this.map});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: map.displayIcon!,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: MediaQuery.of(context).size.height/2.2,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(AppPadding.s3),
          margin: const EdgeInsets.all(AppPadding.s3),
          decoration:
              BoxDecoration(image: DecorationImage(image: imageProvider)),
        );
      },
    );
  }
}