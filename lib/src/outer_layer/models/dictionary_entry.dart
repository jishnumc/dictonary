import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_entry.freezed.dart';
part 'dictionary_entry.g.dart';

@freezed
class DictionaryEntry with _$DictionaryEntry {
  const factory DictionaryEntry({
    required String word,
    String? phonetic,
    required List<Meaning> meanings,
  }) = _DictionaryEntry;

  factory DictionaryEntry.fromJson(Map<String, dynamic> json) =>
      _$DictionaryEntryFromJson(json);
}

@freezed
class Meaning with _$Meaning {
  const factory Meaning({
    required String partOfSpeech,
    required List<Definition> definitions,
  }) = _Meaning;

  factory Meaning.fromJson(Map<String, dynamic> json) => _$MeaningFromJson(json);
}

@freezed
class Definition with _$Definition {
  const factory Definition({
    required String definition,
    List<String>? synonyms,
    List<String>? antonyms,
    String? example,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}
