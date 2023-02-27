import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
class MapInfo extends StatelessWidget {
  final MapEntity map;
  const MapInfo({
    super.key,
    required this.map,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:!AppLocalizations.of(context)!.isEnLocale?Alignment.centerRight:Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.s10, horizontal: AppPadding.s5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              map.displayName!,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(
                  fontSize: FontSize.s24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              map.coordinates!,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(
                fontSize: FontSize.s18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}