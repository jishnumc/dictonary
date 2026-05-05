abstract class Environment {
  static const String baseUrl = String.fromEnvironment('BASE_URL');

  static String getBaseUrl() {
    if (baseUrl.isNotEmpty) return baseUrl;

    return 'https://api.dictionaryapi.dev';
  }
}
