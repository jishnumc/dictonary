import 'package:dictonary/src/features/auth/_self/auth_notifier.dart';
import 'package:dictonary/src/features/auth/login/view/login_page.dart';
import 'package:dictonary/src/features/home/view/home_page.dart';
import 'package:dictonary/src/features/profile/view/profile_page.dart';
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
  /// A [ChangeNotifier] that triggers a router redirect whenever the
  /// authentication state changes.
  final routerListenable = RouterListenable(ref);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable: routerListenable,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isLoggedIn = authState.asData?.value.isAuth ?? false;
      final isLoggingIn = state.uri.path == '/login';

      if (!isLoggedIn) {
        if (isLoggingIn) return null;

        final fromLoc = state.uri.toString();
        if (fromLoc == '/') return '/login';
        return '/login?from=${Uri.encodeComponent(fromLoc)}';
      }

      if (isLoggingIn) {
        final fromLoc = state.uri.queryParameters['from'];
        if (fromLoc != null && fromLoc.isNotEmpty) {
          return Uri.decodeComponent(fromLoc);
        }
        return '/';
      }

      return null;
    },
    initialLocation: '/',
    routes: [
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
