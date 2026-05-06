import 'package:chopper/chopper.dart';

part 'dictionary_service.chopper.dart';

@ChopperApi(baseUrl: '/api/v2/entries/en')
abstract class DictionaryService extends ChopperService {
  static DictionaryService create([ChopperClient? client]) =>
      _$DictionaryService(client);

  @GET(path: '/{word}')
  Future<Response<List<dynamic>>> getWordDefinition(@Path() String word);
}
