import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomflutter/routing/not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecomflutter/screens/splash/splash_screen.dart';
// import 'package:ecomflutter/features/homescreen.dart';

enum AppRoute { splashScreen, home }

class PostRouteExtra {}

// private navigator
final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.splashScreen.name,
        builder: (context, state) {
          return SplashScreen(
            key: state.pageKey,
          );
        },
      )
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
