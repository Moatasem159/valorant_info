import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/features/agents/domain/entities/role.dart';
class RoleImage extends StatelessWidget {
  final Role role;
  final String agentId;
  const RoleImage({Key? key, required this.role, required this.agentId,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero${role.roleId}$agentId",
      child: CachedNetworkImage(
        imageUrl: role.displayIcon!,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: AppSize.s45,
            height: AppSize.s45,
            margin: const EdgeInsets.all(AppPadding.s5),
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
