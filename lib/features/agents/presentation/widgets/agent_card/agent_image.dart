import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
class AgentImage extends StatelessWidget {
  final String image;
  const AgentImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder:(context, imageProvider) {
          return Container(
            width: AppSize.s160,
            height: AppSize.s250,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitHeight
                )
            ),
          );
        },
      ),
    );
  }
}