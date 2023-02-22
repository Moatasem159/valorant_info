import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:valorant_info/features/settings/presentation/widgets/settings_tile.dart';
class BuildThemeScreenBody extends StatelessWidget{
  const BuildThemeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsTile(
            title: AppStrings.darkTheme,
            icon: Icons.brightness_3_outlined,
            onTap: () => BlocProvider.of<ThemeCubit>(context).toDark()),
        SettingsTile(
            title: AppStrings.lightTheme,
            icon: Icons.brightness_5_sharp,
            onTap: () => BlocProvider.of<ThemeCubit>(context).toLight(),),
      ],
    );
  }

}