import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
class WeaponImage extends StatelessWidget {
  final String image;
  const WeaponImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:image,
      imageBuilder: (context, imageProvider) {
        return Container(
          margin: const EdgeInsets.all(AppPadding.s5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.s10),
              color: Theme.of(context).primaryColor,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              )),
        );
      },
      placeholder: (context, imageProvider) {
        return Container(
          padding: const EdgeInsets.all(AppPadding.s8),
          margin: const EdgeInsets.all(AppPadding.s10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.s10),
            color: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }
}