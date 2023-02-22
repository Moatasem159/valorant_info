import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/core/widgets/app_appbar.dart';
import 'package:valorant_info/features/settings/presentation/widgets/settings_screen_widgets/build_settings_screen_body.dart';
class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const CustomAppBar(title: AppStrings.settings),
          body: const BuildSettingsScreenBody(),
        ));
  }
}

