import 'package:dictonary/src/system/flavor.dart';

abstract class Environment {
  static const String baseUrl = String.fromEnvironment('BASE_URL');

  static String getBaseUrl(AppFlavor flavor) {
    if (baseUrl.isNotEmpty) return baseUrl;

    return switch (flavor) {
      AppFlavor.development => 'https://dev.dictionaryapi.dev',
      AppFlavor.staging => 'https://stg.dictionaryapi.dev',
      AppFlavor.production => 'https://api.dictionaryapi.dev',
    };
  }
}
