import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

enum AppThemeMode { system, light, dark, highContrastLight, highContrastDark }

extension AppThemeModeX on AppThemeMode {
  ThemeMode get flutterThemeMode => switch (this) {
    AppThemeMode.system => ThemeMode.system,
    AppThemeMode.light || AppThemeMode.highContrastLight => ThemeMode.light,
    AppThemeMode.dark || AppThemeMode.highContrastDark => ThemeMode.dark,
  };
}

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(AppThemeMode.system) AppThemeMode themeMode,
    String? languageCode,
    @Default(false) bool isDebugEnabled,
  }) = _AppSettings;

  const AppSettings._();

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  bool get hasLocale => languageCode != null;
}
