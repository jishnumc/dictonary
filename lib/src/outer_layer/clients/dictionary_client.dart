import 'package:chopper/chopper.dart';
import 'package:dictonary/src/outer_layer/models/dictionary_entry.dart';

part 'dictionary_client.chopper.dart';

@ChopperApi(baseUrl: '/entries/en')
abstract class DictionaryClient extends ChopperService {
  @Get(path: '/{word}')
  Future<Response<List<DictionaryEntry>>> getWordDefinition(
    @Path('word') String word,
  );

  static DictionaryClient create([ChopperClient? client]) =>
      _$DictionaryClient(client);
}
