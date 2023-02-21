import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/agents/domain/entities/ability.dart';
class AbilityDescription extends StatelessWidget {
  final Ability ability;
  const AbilityDescription({super.key,required this.ability});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.s8),
      margin: const EdgeInsets.all(AppPadding.s8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.s10),
        border: Border.all(width: 1,color: Colors.white)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ability.slot!,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white,
                fontSize: FontSize.s16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSize.s10,),
          Text(
            ability.displayName!,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(
                color: Colors.white,
                fontSize: FontSize.s16,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: AppSize.s10,),
          Text(
            ability.description!,
            style:
            Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Colors.white,
              fontSize: FontSize.s14,
            ),
          ),
        ],
      ),
    );
  }
}