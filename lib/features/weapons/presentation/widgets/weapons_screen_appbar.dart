import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
class WeaponsScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const WeaponsScreenAppBar({super.key,});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(AppStrings.weapons),
      centerTitle: true,
      elevation: 0,
    );
  }
  @override
  Size get preferredSize =>const Size(double.infinity,50);
}