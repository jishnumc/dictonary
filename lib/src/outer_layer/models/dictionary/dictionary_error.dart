import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_error.freezed.dart';
part 'dictionary_error.g.dart';

@freezed
abstract class DictionaryError with _$DictionaryError {
  const factory DictionaryError({
    required String title,
    required String message,
    required String resolution,
  }) = _DictionaryError;

  factory DictionaryError.fromJson(Map<String, dynamic> json) =>
      _$DictionaryErrorFromJson(json);
}

class DictionaryException implements Exception {
  DictionaryException(this.error);
  final DictionaryError error;

  @override
  String toString() => '${error.title}: ${error.message}';
}
