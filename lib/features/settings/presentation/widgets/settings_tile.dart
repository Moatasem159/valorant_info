import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/font_size.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
          vertical: AppPadding.s8, horizontal: AppPadding.s25),
      onTap: onTap,
      title: Text(title.tr(context)!,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
        fontSize: FontSize.s18,
      )),
      trailing: Icon(icon, color: Theme.of(context).iconTheme.color),
    );
  }
}