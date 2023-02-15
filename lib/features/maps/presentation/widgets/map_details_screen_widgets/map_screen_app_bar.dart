import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
class MapDetailsScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final MapEntity map;
  const MapDetailsScreenAppBar({super.key, required this.map});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Icon(Icons.arrow_back,
              color: Colors.white)),
      flexibleSpace: CachedNetworkImage(
        imageUrl: map.listViewIcon!,
        imageBuilder: (context, imageProvider) {
          return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.fitWidth)));
        },
      ),
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 55);
}