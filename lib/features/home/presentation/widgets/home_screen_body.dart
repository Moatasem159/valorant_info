import 'package:flutter/material.dart';
import 'package:valorant_info/features/home/presentation/widgets/build_home_body.dart';
import 'package:valorant_info/features/home/presentation/widgets/home_screen_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const HomeScreenAppBar(),
        body: const BuildHomeBody(),
      ),
    );
  }
}