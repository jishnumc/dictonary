// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'dictionary_client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$DictionaryClient extends DictionaryClient {
  _$DictionaryClient([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = DictionaryClient;

  @override
  Future<Response<List<DictionaryEntry>>> getWordDefinition(String word) {
    final Uri $url = Uri.parse('/entries/en/${word}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<List<DictionaryEntry>, DictionaryEntry>($request);
  }
}
