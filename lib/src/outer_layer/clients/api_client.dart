import 'package:chopper/chopper.dart';
import 'package:dictonary/src/outer_layer/network/json_response_converter.dart';
import 'package:dictonary/src/outer_layer/network/network_log_interceptor.dart';
import 'package:dictonary/src/system/environment.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

/// A wrapper around [ChopperClient] for making network requests.
class ApiClient {
  ApiClient() {
    _client = ChopperClient(
      baseUrl: Uri.parse(Environment.baseUrl),
      services: [
        //DictonaryService.create()
      ],
      converter: const JsonResponseConverter(),
      interceptors: [
        const NetworkLogInterceptor(),
        // Ensure Cloudflare-backed APIs don't reject Dart's default user agent
        const HeadersInterceptor({
          'Accept': 'application/json',
          'User-Agent': 'dictonary/1.0 (Flutter)',
        }),
      ],
    );
  }

  late final ChopperClient _client;

  /// Returns the underlying [ChopperClient].
  ChopperClient get client => _client;

  /// Retrieves a registered [ChopperService].
  T getService<T extends ChopperService>() => _client.getService<T>();
}

/// Keep-alive so the client is never disposed while requests are in-flight.
@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  return ApiClient();
}
