import 'package:dictonary/src/features/auth/_self/auth_notifier.dart';
import 'package:dictonary/src/features/auth/login/view/login_page.dart';
import 'package:dictonary/src/features/home/view/home_page.dart';
import 'package:dictonary/src/features/profile/view/profile_page.dart';
import 'package:dictonary/src/features/splash/view/splash_page.dart';
import 'package:dictonary/src/outer_layer/models/auth/auth_user.dart';
import 'package:dictonary/src/routes/main_shell.dart';
import 'package:dictonary/src/routes/router_listenable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final routerListenable = RouterListenable(ref);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable: routerListenable,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isLoggedIn = authState.asData?.value.isAuth ?? false;
      final isSplash = state.uri.path == '/splash';
      final isLoggingIn = state.uri.path == '/login';

      if (isSplash) return null;

      if (!isLoggedIn) {
        if (isLoggingIn) return null;
        return '/login';
      }

      if (isLoggingIn) return '/';

      return null;
    },
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LoginPage(),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
