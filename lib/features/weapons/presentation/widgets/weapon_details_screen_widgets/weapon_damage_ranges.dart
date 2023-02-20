import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/domain/entities/damage_range.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/damage_range_widget.dart';
class WeaponDamageRanges extends StatelessWidget {
  final List<DamageRange> damageRanges;
  const WeaponDamageRanges({super.key, required this.damageRanges});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.damageRanges,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: FontSize.s24),
        ),
        Column(
            children: damageRanges
                .map((e) => DamageRangeWidget(
              damageRange: e,
            )).toList()),
      ],
    );
  }
}