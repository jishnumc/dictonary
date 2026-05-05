import 'package:dictonary/src/app_ui/app_ui.dart';
import 'package:dictonary/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    // final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: 'Dictonary',
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: AppLocalizations.supportedLocales,
      // locale: settings.hasLocale ? Locale(settings.languageCode!) : null,
      theme: const AppThemeLight(TextThemeNative()).themeData,
      darkTheme: const AppThemeDark(TextThemeNative()).themeData,
      // themeMode: settings.themeMode.flutterThemeMode,
      routerConfig: router,
    );
  }
}
