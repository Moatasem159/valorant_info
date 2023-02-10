import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/features/agents/domain/entities/ability.dart';
class AbilityWidget extends StatelessWidget {
  final Ability ability;
  final VoidCallback onTap;
  const AbilityWidget({super.key, required this.ability,required this.onTap,});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ability.isSelected!?Colors.red[500]:null,
            borderRadius: BorderRadius.circular(AppRadius.s10),
            border: Border.all(width: 1,color: Colors.white)
        ),
        padding: const EdgeInsets.all(AppPadding.s5),
        margin: const EdgeInsets.all(AppPadding.s5),
        child: CachedNetworkImage(
          imageUrl: ability.displayIcon!,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: AppSize.s65,
              height: AppSize.s65,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider
                  )
              ),
            );
          },
          placeholder: (context, url) =>const SizedBox(
            width: AppSize.s65,
            height: AppSize.s65,
          ),
          errorWidget: (context, url, error) =>Container(
            alignment: Alignment.center,
            width: AppSize.s80,
            height: AppSize.s50,
            child: Text(ability.displayName!,style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Colors.white,

            )),
          ) ,
        ),
      ),
    );
  }
}