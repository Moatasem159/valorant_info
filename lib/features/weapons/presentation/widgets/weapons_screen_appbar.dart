import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
class WeaponsScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const WeaponsScreenAppBar({super.key,});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:Text(AppStrings.weapons.tr(context)!),
      centerTitle: true,
    );
  }
  @override
  Size get preferredSize =>const Size(double.infinity,50);
}