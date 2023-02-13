import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
class MapCardImage extends StatelessWidget {
  final MapEntity map;
  const MapCardImage({super.key, required this.map,});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: map.splash!,
      imageBuilder: (context, imageProvider) {
        return Container(
            height: MediaQuery.of(context).size.height/3.7,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(AppPadding.s3),
            margin: const EdgeInsets.all(AppPadding.s5),
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.s14),
                image: DecorationImage(image: imageProvider)
            )
        );
      },
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[600]!,
        highlightColor:Colors.grey[500]! ,
        child: Container(
            height: MediaQuery.of(context).size.height/3.7,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(AppPadding.s3),
            margin: const EdgeInsets.all(AppPadding.s5),
            decoration:BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(AppRadius.s14),
            )
        ),
      ) ,
    );
  }
}