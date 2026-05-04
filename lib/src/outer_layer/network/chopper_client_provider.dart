import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:dictonary/src/outer_layer/clients/dictionary_client.dart';
import 'package:dictonary/src/outer_layer/models/dictionary_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chopper_client_provider.g.dart';

@riverpod
ChopperClient chopperClient(Ref ref) {
  return ChopperClient(
    baseUrl: Uri.parse('https://api.dictionaryapi.dev/api/v2'),
    services: [
      DictionaryClient.create(),
    ],
    converter: const JsonSerializableConverter({
      DictionaryEntry: DictionaryEntry.fromJson,
    }),
    interceptors: [
      HttpLoggingInterceptor(),
    ],
  );
}

@riverpod
DictionaryClient dictionaryClient(Ref ref) {
  return ref.watch(chopperClientProvider).getService<DictionaryClient>();
}

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  const JsonSerializableConverter(this.factories);

  final Map<Type, JsonFactory> factories;

  @override
  async.FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
    Response response,
  ) async {
    final jsonRes = await super.convertResponse(response);

    return jsonRes.copyWith<ResultType>(
      body: _decode<Item>(jsonRes.body),
    );
  }

  ResultType _decode<ResultType>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<ResultType>(entity) as ResultType;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<ResultType>(entity);
    }

    return entity as ResultType;
  }

  List<ResultType> _decodeList<ResultType>(Iterable values) =>
      values.map<ResultType>((v) => _decode<ResultType>(v)).toList();

  ResultType _decodeMap<ResultType>(Map<String, dynamic> values) {
    final factory = factories[ResultType];
    if (factory != null) {
      return factory(values) as ResultType;
    }

    return values as ResultType;
  }
}
