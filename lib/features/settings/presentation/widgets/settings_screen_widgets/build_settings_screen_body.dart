import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/settings/presentation/widgets/settings_tile.dart';
class BuildSettingsScreenBody extends StatelessWidget {
  const BuildSettingsScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SettingsTile(
          title: AppStrings.language,
          onTap:()=>GoRouter.of(context).pushNamed(Routes.languageRoute),
          icon: Icons.language_outlined,
        ),
        SettingsTile(
          title: AppStrings.theme,
          onTap:()=>GoRouter.of(context).pushNamed(Routes.themeRoute),
          icon: Icons.brightness_4_outlined,
        ),
      ],
    );
  }
}