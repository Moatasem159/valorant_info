import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';

class RoleImage extends StatelessWidget {
  final String image;
  const RoleImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: AppSize.s45,
            height: AppSize.s45,
            margin: const EdgeInsets.all(AppSize.s5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                image: DecorationImage(
                    image: imageProvider
                )
            ),
          );
        },
      ),
    );
  }
}
