import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/app/injection_container.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/config/themes/app_theme.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_cubit.dart';

class ValorantInfo extends StatelessWidget {
  const ValorantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AgentsCubit>()..getAgents(),)
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        routerConfig: AppRoute.router,
      ),
    );
  }
}