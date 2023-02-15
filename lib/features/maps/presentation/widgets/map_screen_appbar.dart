import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_strings.dart';

class MapScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MapScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: const Text(AppStrings.maps),
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 45);
}