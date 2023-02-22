import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/core/widgets/app_appbar.dart';
import 'package:valorant_info/features/settings/presentation/widgets/theme_screen_widgets/build_theme_screen_body.dart';
class ThemeScreenBody extends StatelessWidget{
  const ThemeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CustomAppBar(title: AppStrings.theme),
      body: const BuildThemeScreenBody(),
    ));
  }
}