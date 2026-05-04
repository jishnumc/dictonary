import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize essential dependencies
  final sharedPref = await SharedPreferences.getInstance();

  // Create ProviderContainer with overrides
  final container = ProviderContainer(
    // overrides: [sharedPreferencesProvider.overrideWithValue(sharedPref)],
    // observers: [const AppProviderObserver()],
  );
  // Read required providers so that they initialize correctly
  // ..read(storageClientProvider)
  // ..read(settingsRepositoryProvider);

  return container;
}
