import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeScreenAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(AppStrings.appTitle),
        centerTitle: true,
        elevation: 10,
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity,55);
}
