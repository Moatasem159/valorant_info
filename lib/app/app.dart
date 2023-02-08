import 'package:flutter/material.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/config/themes/app_theme.dart';

class ValorantInfo extends StatelessWidget {
  const ValorantInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme:AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRoute.router,
    );
  }
}