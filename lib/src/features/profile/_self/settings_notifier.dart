import 'package:dictonary/src/outer_layer/models/app_settings.dart';
import 'package:dictonary/src/outer_layer/repositories/settings/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_notifier.g.dart';

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  AppSettings build() {
    return ref.watch(settingsRepositoryProvider).getSettings();
  }

  Future<void> updateThemeMode(AppThemeMode mode) async {
    final newSettings = state.copyWith(themeMode: mode);
    state = newSettings;
    await ref.read(settingsRepositoryProvider).saveSettings(newSettings);
  }

  Future<void> toggleThemeMode() async {
    final newMode = state.themeMode == AppThemeMode.dark
        ? AppThemeMode.light
        : AppThemeMode.dark;
    await updateThemeMode(newMode);
  }
}
