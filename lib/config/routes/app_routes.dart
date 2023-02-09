import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/features/agents/presentation/screens/agents_screen.dart';
import 'package:valorant_info/features/home/presentation/screens/home_screen.dart';

class Routes {
  static const String initialRoute = "/";
  static const String agentsRoute = "/agentsRoute";
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
        name: Routes.agentsRoute,
        path: Routes.agentsRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const AgentsScreen(),
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
    ],
  );
}
