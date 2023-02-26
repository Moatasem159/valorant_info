import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/core/utils/app_constants.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/home/presentation/widgets/card_widget.dart';
class BuildHomeBody extends StatelessWidget {
  const BuildHomeBody({super.key,});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children:[
          CardWidget(
            title: AppStrings.agents,
            cover: Constants.agentsCover,
            onTap: () {
             GoRouter.of(context).pushNamed(Routes.agentsRoute);
            },
          ),
          CardWidget(
            title: AppStrings.maps,
            cover: Constants.mapsCover,
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.mapsRoute);
            },
          ),
          CardWidget(
            title: AppStrings.weapons,
            cover: Constants.weaponsCover,
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.weaponsRoute);
            },
          ),
          // CardWidget(
          //   title: AppStrings.bundles,
          //   cover: Constants.bundlesCover,
          //   onTap: () {
          //     // GoRouter.of(context).pushNamed(Routes.mapsRoute);
          //   },
          // ),
        ],
      ),
    );
  }
}