import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';

/// Logs outgoing requests and incoming responses to the Flutter console.
///
/// Only active in debug mode.
@immutable
final class NetworkLogInterceptor implements Interceptor {
  const NetworkLogInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final request = chain.request;
    if (kDebugMode) {
      print('''
[Network ▲] ${request.method} ${request.url}
  headers: ${request.headers}
  body: ${request.body}''');
    }

    final response = await chain.proceed(request);

    if (kDebugMode) {
      print('''
[Network ▼] ${response.statusCode} ${response.base.request?.url}
  body: ${response.body}''');
    }

    return response;
  }
}
