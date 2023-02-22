import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/weapons/domain/entities/damage_range.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_row_details.dart';
class DamageRangeWidget extends StatelessWidget {
  final DamageRange damageRange;
  const DamageRangeWidget({super.key, required this.damageRange});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.s5),
      child: Column(children: [
        Text(
          "${AppStrings.from.tr(context)!} ${damageRange.rangeStartMeters} ${AppStrings.to.tr(context)!} ${damageRange.rangeEndMeters}",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: FontSize.s20),
        ),
        const SizedBox(
          height: 10,
        ),
        WeaponRowDetails(
            title: AppStrings.headDamage.tr(context)!, isEven: false, infoNum: "${damageRange.headDamage}"),
        WeaponRowDetails(
            title: AppStrings.bodyDamage.tr(context)!, isEven: true, infoNum: "${damageRange.bodyDamage}"),
        WeaponRowDetails(
            title: AppStrings.ledDamage.tr(context)!, isEven: false, infoNum: "${damageRange.legDamage}"),
      ]),
    );
  }
}