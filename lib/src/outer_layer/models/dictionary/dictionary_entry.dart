import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_entry.freezed.dart';
part 'dictionary_entry.g.dart';

@freezed
abstract class DictionaryEntry with _$DictionaryEntry {
  const factory DictionaryEntry({
    required String word,
    String? phonetic,
    @Default([]) List<Phonetic> phonetics,
    String? origin,
    @Default([]) List<Meaning> meanings,
  }) = _DictionaryEntry;

  factory DictionaryEntry.fromJson(Map<String, dynamic> json) =>
      _$DictionaryEntryFromJson(json);
}

@freezed
abstract class Phonetic with _$Phonetic {
  const factory Phonetic({
    String? text,
    String? audio,
  }) = _Phonetic;

  factory Phonetic.fromJson(Map<String, dynamic> json) =>
      _$PhoneticFromJson(json);
}

@freezed
abstract class Meaning with _$Meaning {
  const factory Meaning({
    required String partOfSpeech,
    @Default([]) List<Definition> definitions,
  }) = _Meaning;

  factory Meaning.fromJson(Map<String, dynamic> json) =>
      _$MeaningFromJson(json);
}

@freezed
abstract class Definition with _$Definition {
  const factory Definition({
    required String definition,
    String? example,
    @Default([]) List<String> synonyms,
    @Default([]) List<String> antonyms,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}
