import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_card/map_card_details.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_card/map_card_image.dart';
class MapCard extends StatelessWidget {
  final MapEntity map;
  const MapCard({super.key, required this.map});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.mapDetailsRoute,extra: map);
      },
      child: Stack(
        alignment:!AppLocalizations.of(context)!.isEnLocale?Alignment.bottomRight:Alignment.bottomLeft,
        children: [
          MapCardImage(map: map),
          MapCardDetails(map: map),
        ],
      ),
    );
  }
}