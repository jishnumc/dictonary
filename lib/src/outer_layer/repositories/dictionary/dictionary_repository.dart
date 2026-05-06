import 'package:dictonary/src/outer_layer/clients/api_client.dart';
import 'package:dictonary/src/outer_layer/models/dictionary/dictionary_entry.dart';
import 'package:dictonary/src/outer_layer/models/dictionary/dictionary_error.dart';
import 'package:dictonary/src/outer_layer/network/dictionary_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dictionary_repository.g.dart';

@Riverpod(keepAlive: true)
DictionaryRepository dictionaryRepository(Ref ref) {
  return DictionaryRepository(apiClient: ref.watch(apiClientProvider));
}

class DictionaryRepository {
  DictionaryRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<DictionaryEntry>> getDefinition(String word) async {
    final service = _apiClient.client.getService<DictionaryService>();
    final response = await service.getWordDefinition(word);

    if (response.isSuccessful && response.body != null) {
      return response.body!
          .map((e) => DictionaryEntry.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      if (response.error is Map<String, dynamic>) {
        final error = DictionaryError.fromJson(response.error as Map<String, dynamic>);
        throw DictionaryException(error);
      }
      
      // Fallback for cases where body is null or not a map
      throw DictionaryException(
        DictionaryError(
          title: 'Word not found',
          message: 'We couldn\'t find any definitions for the word you were looking for.',
          resolution: 'Try checking your spelling or search for another word.',
        ),
      );
    }
  }
}
