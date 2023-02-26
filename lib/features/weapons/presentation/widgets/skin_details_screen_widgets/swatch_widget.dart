import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
import 'package:valorant_info/features/weapons/domain/entities/chroma.dart';

class SwatchWidget extends StatelessWidget {
  final Chroma chroma;
  final VoidCallback onTap;
  const SwatchWidget({
    super.key,
    required this.chroma,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: chroma.swatch!,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.all(AppPadding.s10),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 3,
                    color: chroma.isSelected!
                        ? Theme.of(context).primaryColorLight
                        : const Color(0x00000000)),
                borderRadius: BorderRadius.circular(AppRadius.s5),
                image: DecorationImage(image: imageProvider)),
          );
        },
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[400]!,
            child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.all(AppPadding.s10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(AppRadius.s5),
              ),
            ),
          );
        },
      ),
    );
  }
}