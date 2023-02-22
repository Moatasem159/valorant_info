import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/settings/presentation/cubit/locale_cubit/locale_cubit.dart';
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(AppStrings.language.tr(context)!),
      ),
      body: Column(
        children:  [
           ListTile(
            onTap: () {
              BlocProvider.of<LocaleCubit>(context).toEnglish();
            },
            title:Text(AppStrings.englishLang.tr(context)!),
          ),
          ListTile(
            onTap:() {
                  BlocProvider.of<LocaleCubit>(context).toArabic();
            },
            title:Text(AppStrings.arabicLang.tr(context)!),
          ),
        ],
      )
    ),
    );
  }
}
