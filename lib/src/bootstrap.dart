import 'package:dictonary/src/outer_layer/clients/storage_client.dart';
import 'package:dictonary/src/system/flavor.dart';
import 'package:dictonary/src/system/flavor_provider.dart';
import 'package:dictonary/src/utils/app_provider_observer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<ProviderContainer> bootstrap(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize essential dependencies
  final sharedPref = await SharedPreferences.getInstance();

  // Create ProviderContainer with overrides
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPref),
      appFlavorProvider.overrideWithValue(flavor),
    ],
    observers: [const AppProviderObserver()],
  )
    // Read required providers so that they initialize correctly
    ..read(storageClientProvider);
  // ..read(settingsRepositoryProvider);

  return container;
}
