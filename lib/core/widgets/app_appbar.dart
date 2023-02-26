import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/font_size.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title.tr(context)!,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontSize: FontSize.s24)),
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 55);
}