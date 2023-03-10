import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/settings/presentation/cubit/locale_cubit/locale_cubit.dart';
import 'package:valorant_info/features/settings/presentation/widgets/settings_tile.dart';

class BuildLanguageScreenBody extends StatelessWidget {
  const BuildLanguageScreenBody({super.key,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SettingsTile(
          title: AppStrings.englishLang,
          icon: FontAwesomeIcons.language,
          onTap: () =>BlocProvider.of<LocaleCubit>(context).toEnglish(),),
        SettingsTile(
          title: AppStrings.arabicLang,
          icon: FontAwesomeIcons.language,
          onTap: () =>BlocProvider.of<LocaleCubit>(context).toArabic(),),
      ],
    );
  }
}