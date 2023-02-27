import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';

class MapCardDetails extends StatelessWidget {
  final MapEntity map;
  const MapCardDetails({super.key, required this.map,});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:AppLocalizations.of(context)!.isEnLocale?20:0,
      right:!AppLocalizations.of(context)!.isEnLocale?20:0,
      bottom:20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(map.displayName!,style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: FontSize.s20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
          Text(map.coordinates!,style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: FontSize.s16,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),),
        ],
      ),
    );
  }
}