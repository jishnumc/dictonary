import 'package:dictonary/src/outer_layer/models/app_settings.dart';
import 'package:dictonary/src/system/keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../clients/storage_client.dart';

part 'settings_repository.g.dart';

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  return SettingsRepository(storageClient: ref.watch(storageClientProvider));
}

class SettingsRepository {
  const SettingsRepository({required StorageClient storageClient})
    : _storageClient = storageClient;

  final StorageClient _storageClient;

  AppSettings getSettings() {
    final json = _storageClient.read<Map<String, dynamic>>(AppKeys.settings);
    if (json != null) {
      return AppSettings.fromJson(json);
    }
    return const AppSettings();
  }

  Future<void> saveSettings(AppSettings settings) async {
    await _storageClient.save(AppKeys.settings, settings.toJson());
  }
}
