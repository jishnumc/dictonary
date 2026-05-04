// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DictionaryEntry _$DictionaryEntryFromJson(Map<String, dynamic> json) =>
    _DictionaryEntry(
      word: json['word'] as String,
      phonetic: json['phonetic'] as String?,
      meanings: (json['meanings'] as List<dynamic>)
          .map((e) => Meaning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DictionaryEntryToJson(_DictionaryEntry instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetic': instance.phonetic,
      'meanings': instance.meanings,
    };

_Meaning _$MeaningFromJson(Map<String, dynamic> json) => _Meaning(
  partOfSpeech: json['partOfSpeech'] as String,
  definitions: (json['definitions'] as List<dynamic>)
      .map((e) => Definition.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MeaningToJson(_Meaning instance) => <String, dynamic>{
  'partOfSpeech': instance.partOfSpeech,
  'definitions': instance.definitions,
};

_Definition _$DefinitionFromJson(Map<String, dynamic> json) => _Definition(
  definition: json['definition'] as String,
  synonyms: (json['synonyms'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  antonyms: (json['antonyms'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  example: json['example'] as String?,
);

Map<String, dynamic> _$DefinitionToJson(_Definition instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
      'example': instance.example,
    };
