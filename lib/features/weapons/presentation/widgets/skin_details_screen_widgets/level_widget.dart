import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/weapons/domain/entities/level.dart';

class LevelWidget extends StatelessWidget {
  const LevelWidget({super.key,required this.level, required this.onTap});
  final Level level;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(AppPadding.s5),
        padding: const EdgeInsets.all(AppPadding.s5),
        decoration: BoxDecoration(
          color: level.isSelected!?Theme.of(context).primaryColorLight:Theme.of(context).colorScheme.background,
            border: Border.all(width: 1,
                color: Theme.of(context).primaryColorLight
            ),
            borderRadius: BorderRadius.circular(AppRadius.s5)),
        child: Text(level.levelItem == ''
            ? AppStrings.basicLevel
            : level.levelItem!.substring(level.levelItem!.indexOf("::") + 2),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: !level.isSelected!?Theme.of(context).primaryColorLight:Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }
}
