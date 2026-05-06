import 'package:dictonary/src/app_ui/app_ui.dart';
import 'package:dictonary/src/features/profile/_self/settings_notifier.dart';
import 'package:dictonary/src/outer_layer/models/app_settings.dart';
import 'package:dictonary/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: 'Dictonary',
      theme: const AppThemeLight(TextThemeNative()).themeData,
      darkTheme: const AppThemeDark(TextThemeNative()).themeData,
      themeMode: settings.themeMode.flutterThemeMode,
      routerConfig: router,
    );
  }
}
