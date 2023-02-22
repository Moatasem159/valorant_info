import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/widgets/loading_body.dart';
import 'package:valorant_info/features/weapons/presentation/cubits/weapons_cubit.dart';
import 'package:valorant_info/features/weapons/presentation/cubits/weapons_state.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/build_weapons_screen_body.dart';

class WeaponsScreenBody extends StatelessWidget {
  const WeaponsScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      WeaponCubit cubit = WeaponCubit.get(context);
      cubit.getWeapons(AppLocalizations.of(context)!.getLang());
      return BlocBuilder<WeaponCubit, WeaponsStates>(
        builder: (context, state) {
          if (state is GetWeaponsSuccessState) {
            return BuildWeaponsScreenBody(weapons: cubit.weapons);
          }
          return const LoadingBody();
        },
      );
    });
  }
}

