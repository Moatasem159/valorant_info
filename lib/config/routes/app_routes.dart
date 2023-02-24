import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/app/injection_container.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_cubit.dart';
import 'package:valorant_info/features/agents/presentation/screens/agent_details_screen.dart';
import 'package:valorant_info/features/agents/presentation/screens/agents_screen.dart';
import 'package:valorant_info/features/home/presentation/screens/home_screen.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/presentation/cubits/map_cubit.dart';
import 'package:valorant_info/features/maps/presentation/screens/map_details_screen.dart';
import 'package:valorant_info/features/maps/presentation/screens/maps_screen.dart';
import 'package:valorant_info/features/settings/presentation/screens/language_screen.dart';
import 'package:valorant_info/features/settings/presentation/screens/settings_screen.dart';
import 'package:valorant_info/features/settings/presentation/screens/theme_screen.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/presentation/cubits/weapons_cubit.dart';
import 'package:valorant_info/features/weapons/presentation/screens/skins_screen.dart';
import 'package:valorant_info/features/weapons/presentation/screens/weapon_details_screen.dart';
import 'package:valorant_info/features/weapons/presentation/screens/weapons_screen.dart';
abstract class Routes {
  static const String initialRoute = "/";
  static const String agentsRoute = "/agentsRoute";
  static const String settingsRoute = "/settingsRoute";
  static const String languageRoute = "/languageRoute";
  static const String themeRoute = "/themeRoute";
  static const String agentDetailsRoute = "/agentDetailsRoute";
  static const String mapsRoute = "/mapsRoute";
  static const String mapDetailsRoute = "/mapDetailsRoute";
  static const String weaponsRoute = "/weaponsRoute";
  static const String weaponDetailsRoute = "/weaponDetailsRoute";
  static const String skinsScreenRoute = "/skinsScreenRoute";

}

abstract class AppRoute {
  static final router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.initialRoute,
        path: Routes.initialRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: Routes.settingsRoute,
        path: Routes.settingsRoute,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        name: Routes.languageRoute,
        path: Routes.languageRoute,
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        name: Routes.themeRoute,
        path: Routes.themeRoute,
        builder: (context, state) => const ThemeScreen(),
      ),
      GoRoute(
        name: Routes.agentsRoute,
        path: Routes.agentsRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: BlocProvider(create: (context) => sl<AgentsCubit>(),child: const AgentsScreen(),),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
               opacity: animation,
                alwaysIncludeSemantics: true,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: Routes.agentDetailsRoute,
        path: Routes.agentDetailsRoute,
        builder: (context, state) =>  AgentDetailsScreen(
          agent:state.extra as Agent,
        ),
      ),
      GoRoute(
        name: Routes.mapsRoute,
        path: Routes.mapsRoute,
        builder: (context, state) => BlocProvider(
            create: (context) => sl<MapCubit>(), child: const MapsScreen()),
      ),
      GoRoute(
        name: Routes.mapDetailsRoute,
        path: Routes.mapDetailsRoute,
        builder: (context, state) => MapDetailsScreen(
            map: state.extra as MapEntity,
        ),
      ),
      GoRoute(
        name: Routes.weaponsRoute,
        path: Routes.weaponsRoute,
        builder: (context, state) =>  BlocProvider(
            create: (context) => sl<WeaponCubit>(), child: const WeaponsScreen()),
      ),
      GoRoute(
        name: Routes.weaponDetailsRoute,
        path: Routes.weaponDetailsRoute,
        builder: (context, state) => WeaponDetailsScreen(
          weapon: state.extra as Weapon),
      ),
      GoRoute(
        name: Routes.skinsScreenRoute,
        path: Routes.skinsScreenRoute,
        builder: (context, state) => SkinsScreen(weapon:  state.extra as Weapon),
      ),
    ],
  );
}
