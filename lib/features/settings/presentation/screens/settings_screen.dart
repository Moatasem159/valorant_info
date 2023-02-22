import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/core/utils/app_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: Column(
        children:[
         ListTile(
           onTap: () {
             GoRouter.of(context).pushNamed(Routes.languageRoute);
           },
           title:Text(AppStrings.language.tr(context)!),
           trailing: const Icon(Icons.language_outlined),
         )
        ],
      ),
    ));
  }
}
