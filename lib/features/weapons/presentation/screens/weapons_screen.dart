import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/features/weapons/presentation/cubits/weapons_cubit.dart';
import 'package:valorant_info/features/weapons/presentation/cubits/weapons_state.dart';
class WeaponsScreen extends StatelessWidget {
  const WeaponsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          WeaponCubit cubit = WeaponCubit.get(context);
          cubit.getWeapons();
          return BlocBuilder<WeaponCubit, WeaponsStates>(
            builder: (context, state) {
              return const SafeArea(child: Scaffold(
                body: Center(child: Text('data')),
              ));
            },
          );
        }
    );
  }
}