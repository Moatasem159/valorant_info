import 'package:flutter/material.dart';
import 'package:valorant_info/features/home/presentation/widgets/home_screen_app_bar.dart';


class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: const HomeScreenAppBar(),
          body: Column(
            children: const [

            ],
          ),
        ));
  }
}

