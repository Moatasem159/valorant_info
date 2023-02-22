import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/app/injection_container.dart';
import 'package:valorant_info/config/lang/app_localizations_setup.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/config/themes/app_theme.dart';
import 'package:valorant_info/features/settings/presentation/cubit/locale_cubit/locale_cubit.dart';
import 'package:valorant_info/features/settings/presentation/cubit/locale_cubit/locale_states.dart';
import 'package:valorant_info/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:valorant_info/features/settings/presentation/cubit/theme_cubit/theme_state.dart';

class ValorantInfo extends StatelessWidget {
  const ValorantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<LocaleCubit>()..getSavedLang(),
        ),
        BlocProvider(
          create: (context) => sl<ThemeCubit>()..getTheme(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleStates>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, localeState) {
          return BlocBuilder<ThemeCubit, ThemeStates>(
            buildWhen: (previous, current) {
              return previous != current;
            },
            builder: (context, themeState) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                locale: localeState.locale,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode:  themeState.isDark?ThemeMode.dark:ThemeMode.light,
                routerConfig: AppRoute.router,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
              );
            },
          );
        },
      ),
    );
  }
}
