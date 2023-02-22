import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeScreenAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title:Text(AppStrings.appTitle.tr(context)!),
        centerTitle: true,
      actions: [
        IconButton(
            onPressed: (){
              GoRouter.of(context).pushNamed(Routes.settingsRoute);
            },
            icon: const Icon(Icons.menu))
      ],
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity,55);
}
