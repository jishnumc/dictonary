// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DictionaryEntry {

 String get word; String? get phonetic; List<Meaning> get meanings;
/// Create a copy of DictionaryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DictionaryEntryCopyWith<DictionaryEntry> get copyWith => _$DictionaryEntryCopyWithImpl<DictionaryEntry>(this as DictionaryEntry, _$identity);

  /// Serializes this DictionaryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DictionaryEntry&&(identical(other.word, word) || other.word == word)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&const DeepCollectionEquality().equals(other.meanings, meanings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,phonetic,const DeepCollectionEquality().hash(meanings));

@override
String toString() {
  return 'DictionaryEntry(word: $word, phonetic: $phonetic, meanings: $meanings)';
}


}

/// @nodoc
abstract mixin class $DictionaryEntryCopyWith<$Res>  {
  factory $DictionaryEntryCopyWith(DictionaryEntry value, $Res Function(DictionaryEntry) _then) = _$DictionaryEntryCopyWithImpl;
@useResult
$Res call({
 String word, String? phonetic, List<Meaning> meanings
});




}
/// @nodoc
class _$DictionaryEntryCopyWithImpl<$Res>
    implements $DictionaryEntryCopyWith<$Res> {
  _$DictionaryEntryCopyWithImpl(this._self, this._then);

  final DictionaryEntry _self;
  final $Res Function(DictionaryEntry) _then;

/// Create a copy of DictionaryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? phonetic = freezed,Object? meanings = null,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,phonetic: freezed == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String?,meanings: null == meanings ? _self.meanings : meanings // ignore: cast_nullable_to_non_nullable
as List<Meaning>,
  ));
}

}


/// Adds pattern-matching-related methods to [DictionaryEntry].
extension DictionaryEntryPatterns on DictionaryEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DictionaryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DictionaryEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DictionaryEntry value)  $default,){
final _that = this;
switch (_that) {
case _DictionaryEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DictionaryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DictionaryEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  String? phonetic,  List<Meaning> meanings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DictionaryEntry() when $default != null:
return $default(_that.word,_that.phonetic,_that.meanings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  String? phonetic,  List<Meaning> meanings)  $default,) {final _that = this;
switch (_that) {
case _DictionaryEntry():
return $default(_that.word,_that.phonetic,_that.meanings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  String? phonetic,  List<Meaning> meanings)?  $default,) {final _that = this;
switch (_that) {
case _DictionaryEntry() when $default != null:
return $default(_that.word,_that.phonetic,_that.meanings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DictionaryEntry implements DictionaryEntry {
  const _DictionaryEntry({required this.word, this.phonetic, required final  List<Meaning> meanings}): _meanings = meanings;
  factory _DictionaryEntry.fromJson(Map<String, dynamic> json) => _$DictionaryEntryFromJson(json);

@override final  String word;
@override final  String? phonetic;
 final  List<Meaning> _meanings;
@override List<Meaning> get meanings {
  if (_meanings is EqualUnmodifiableListView) return _meanings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meanings);
}


/// Create a copy of DictionaryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DictionaryEntryCopyWith<_DictionaryEntry> get copyWith => __$DictionaryEntryCopyWithImpl<_DictionaryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DictionaryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DictionaryEntry&&(identical(other.word, word) || other.word == word)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&const DeepCollectionEquality().equals(other._meanings, _meanings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,phonetic,const DeepCollectionEquality().hash(_meanings));

@override
String toString() {
  return 'DictionaryEntry(word: $word, phonetic: $phonetic, meanings: $meanings)';
}


}

/// @nodoc
abstract mixin class _$DictionaryEntryCopyWith<$Res> implements $DictionaryEntryCopyWith<$Res> {
  factory _$DictionaryEntryCopyWith(_DictionaryEntry value, $Res Function(_DictionaryEntry) _then) = __$DictionaryEntryCopyWithImpl;
@override @useResult
$Res call({
 String word, String? phonetic, List<Meaning> meanings
});




}
/// @nodoc
class __$DictionaryEntryCopyWithImpl<$Res>
    implements _$DictionaryEntryCopyWith<$Res> {
  __$DictionaryEntryCopyWithImpl(this._self, this._then);

  final _DictionaryEntry _self;
  final $Res Function(_DictionaryEntry) _then;

/// Create a copy of DictionaryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? phonetic = freezed,Object? meanings = null,}) {
  return _then(_DictionaryEntry(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,phonetic: freezed == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String?,meanings: null == meanings ? _self._meanings : meanings // ignore: cast_nullable_to_non_nullable
as List<Meaning>,
  ));
}


}


/// @nodoc
mixin _$Meaning {

 String get partOfSpeech; List<Definition> get definitions;
/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeaningCopyWith<Meaning> get copyWith => _$MeaningCopyWithImpl<Meaning>(this as Meaning, _$identity);

  /// Serializes this Meaning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Meaning&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&const DeepCollectionEquality().equals(other.definitions, definitions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partOfSpeech,const DeepCollectionEquality().hash(definitions));

@override
String toString() {
  return 'Meaning(partOfSpeech: $partOfSpeech, definitions: $definitions)';
}


}

/// @nodoc
abstract mixin class $MeaningCopyWith<$Res>  {
  factory $MeaningCopyWith(Meaning value, $Res Function(Meaning) _then) = _$MeaningCopyWithImpl;
@useResult
$Res call({
 String partOfSpeech, List<Definition> definitions
});




}
/// @nodoc
class _$MeaningCopyWithImpl<$Res>
    implements $MeaningCopyWith<$Res> {
  _$MeaningCopyWithImpl(this._self, this._then);

  final Meaning _self;
  final $Res Function(Meaning) _then;

/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partOfSpeech = null,Object? definitions = null,}) {
  return _then(_self.copyWith(
partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,definitions: null == definitions ? _self.definitions : definitions // ignore: cast_nullable_to_non_nullable
as List<Definition>,
  ));
}

}


/// Adds pattern-matching-related methods to [Meaning].
extension MeaningPatterns on Meaning {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Meaning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Meaning value)  $default,){
final _that = this;
switch (_that) {
case _Meaning():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Meaning value)?  $default,){
final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String partOfSpeech,  List<Definition> definitions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that.partOfSpeech,_that.definitions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String partOfSpeech,  List<Definition> definitions)  $default,) {final _that = this;
switch (_that) {
case _Meaning():
return $default(_that.partOfSpeech,_that.definitions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String partOfSpeech,  List<Definition> definitions)?  $default,) {final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that.partOfSpeech,_that.definitions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Meaning implements Meaning {
  const _Meaning({required this.partOfSpeech, required final  List<Definition> definitions}): _definitions = definitions;
  factory _Meaning.fromJson(Map<String, dynamic> json) => _$MeaningFromJson(json);

@override final  String partOfSpeech;
 final  List<Definition> _definitions;
@override List<Definition> get definitions {
  if (_definitions is EqualUnmodifiableListView) return _definitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_definitions);
}


/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeaningCopyWith<_Meaning> get copyWith => __$MeaningCopyWithImpl<_Meaning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeaningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meaning&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&const DeepCollectionEquality().equals(other._definitions, _definitions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partOfSpeech,const DeepCollectionEquality().hash(_definitions));

@override
String toString() {
  return 'Meaning(partOfSpeech: $partOfSpeech, definitions: $definitions)';
}


}

/// @nodoc
abstract mixin class _$MeaningCopyWith<$Res> implements $MeaningCopyWith<$Res> {
  factory _$MeaningCopyWith(_Meaning value, $Res Function(_Meaning) _then) = __$MeaningCopyWithImpl;
@override @useResult
$Res call({
 String partOfSpeech, List<Definition> definitions
});




}
/// @nodoc
class __$MeaningCopyWithImpl<$Res>
    implements _$MeaningCopyWith<$Res> {
  __$MeaningCopyWithImpl(this._self, this._then);

  final _Meaning _self;
  final $Res Function(_Meaning) _then;

/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partOfSpeech = null,Object? definitions = null,}) {
  return _then(_Meaning(
partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,definitions: null == definitions ? _self._definitions : definitions // ignore: cast_nullable_to_non_nullable
as List<Definition>,
  ));
}


}


/// @nodoc
mixin _$Definition {

 String get definition; List<String>? get synonyms; List<String>? get antonyms; String? get example;
/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefinitionCopyWith<Definition> get copyWith => _$DefinitionCopyWithImpl<Definition>(this as Definition, _$identity);

  /// Serializes this Definition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Definition&&(identical(other.definition, definition) || other.definition == definition)&&const DeepCollectionEquality().equals(other.synonyms, synonyms)&&const DeepCollectionEquality().equals(other.antonyms, antonyms)&&(identical(other.example, example) || other.example == example));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,definition,const DeepCollectionEquality().hash(synonyms),const DeepCollectionEquality().hash(antonyms),example);

@override
String toString() {
  return 'Definition(definition: $definition, synonyms: $synonyms, antonyms: $antonyms, example: $example)';
}


}

/// @nodoc
abstract mixin class $DefinitionCopyWith<$Res>  {
  factory $DefinitionCopyWith(Definition value, $Res Function(Definition) _then) = _$DefinitionCopyWithImpl;
@useResult
$Res call({
 String definition, List<String>? synonyms, List<String>? antonyms, String? example
});




}
/// @nodoc
class _$DefinitionCopyWithImpl<$Res>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._self, this._then);

  final Definition _self;
  final $Res Function(Definition) _then;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? definition = null,Object? synonyms = freezed,Object? antonyms = freezed,Object? example = freezed,}) {
  return _then(_self.copyWith(
definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,synonyms: freezed == synonyms ? _self.synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,antonyms: freezed == antonyms ? _self.antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Definition].
extension DefinitionPatterns on Definition {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Definition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Definition() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Definition value)  $default,){
final _that = this;
switch (_that) {
case _Definition():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Definition value)?  $default,){
final _that = this;
switch (_that) {
case _Definition() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String definition,  List<String>? synonyms,  List<String>? antonyms,  String? example)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Definition() when $default != null:
return $default(_that.definition,_that.synonyms,_that.antonyms,_that.example);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String definition,  List<String>? synonyms,  List<String>? antonyms,  String? example)  $default,) {final _that = this;
switch (_that) {
case _Definition():
return $default(_that.definition,_that.synonyms,_that.antonyms,_that.example);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String definition,  List<String>? synonyms,  List<String>? antonyms,  String? example)?  $default,) {final _that = this;
switch (_that) {
case _Definition() when $default != null:
return $default(_that.definition,_that.synonyms,_that.antonyms,_that.example);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Definition implements Definition {
  const _Definition({required this.definition, final  List<String>? synonyms, final  List<String>? antonyms, this.example}): _synonyms = synonyms,_antonyms = antonyms;
  factory _Definition.fromJson(Map<String, dynamic> json) => _$DefinitionFromJson(json);

@override final  String definition;
 final  List<String>? _synonyms;
@override List<String>? get synonyms {
  final value = _synonyms;
  if (value == null) return null;
  if (_synonyms is EqualUnmodifiableListView) return _synonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _antonyms;
@override List<String>? get antonyms {
  final value = _antonyms;
  if (value == null) return null;
  if (_antonyms is EqualUnmodifiableListView) return _antonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? example;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefinitionCopyWith<_Definition> get copyWith => __$DefinitionCopyWithImpl<_Definition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Definition&&(identical(other.definition, definition) || other.definition == definition)&&const DeepCollectionEquality().equals(other._synonyms, _synonyms)&&const DeepCollectionEquality().equals(other._antonyms, _antonyms)&&(identical(other.example, example) || other.example == example));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,definition,const DeepCollectionEquality().hash(_synonyms),const DeepCollectionEquality().hash(_antonyms),example);

@override
String toString() {
  return 'Definition(definition: $definition, synonyms: $synonyms, antonyms: $antonyms, example: $example)';
}


}

/// @nodoc
abstract mixin class _$DefinitionCopyWith<$Res> implements $DefinitionCopyWith<$Res> {
  factory _$DefinitionCopyWith(_Definition value, $Res Function(_Definition) _then) = __$DefinitionCopyWithImpl;
@override @useResult
$Res call({
 String definition, List<String>? synonyms, List<String>? antonyms, String? example
});




}
/// @nodoc
class __$DefinitionCopyWithImpl<$Res>
    implements _$DefinitionCopyWith<$Res> {
  __$DefinitionCopyWithImpl(this._self, this._then);

  final _Definition _self;
  final $Res Function(_Definition) _then;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? definition = null,Object? synonyms = freezed,Object? antonyms = freezed,Object? example = freezed,}) {
  return _then(_Definition(
definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,synonyms: freezed == synonyms ? _self._synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,antonyms: freezed == antonyms ? _self._antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
