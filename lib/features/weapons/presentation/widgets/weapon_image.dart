import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
class WeaponImage extends StatelessWidget {
  final String image;
  const WeaponImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero$image",
      child: InteractiveViewer(
        child: CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) {
            return Container(
              margin: const EdgeInsets.all(AppPadding.s5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.s10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  )),
            );
          },
          placeholder: (context, url) => Container(
            margin: const EdgeInsets.all(AppPadding.s5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.s10),
               ),
          ),
        ),
      ),
    );
  }
}