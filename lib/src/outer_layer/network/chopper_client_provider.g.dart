// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chopperClient)
final chopperClientProvider = ChopperClientProvider._();

final class ChopperClientProvider
    extends $FunctionalProvider<ChopperClient, ChopperClient, ChopperClient>
    with $Provider<ChopperClient> {
  ChopperClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chopperClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chopperClientHash();

  @$internal
  @override
  $ProviderElement<ChopperClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChopperClient create(Ref ref) {
    return chopperClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChopperClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChopperClient>(value),
    );
  }
}

String _$chopperClientHash() => r'c58a8e7574f30d9a0dbb437e25ac774ce16b20d2';

@ProviderFor(dictionaryClient)
final dictionaryClientProvider = DictionaryClientProvider._();

final class DictionaryClientProvider
    extends
        $FunctionalProvider<
          DictionaryClient,
          DictionaryClient,
          DictionaryClient
        >
    with $Provider<DictionaryClient> {
  DictionaryClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dictionaryClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dictionaryClientHash();

  @$internal
  @override
  $ProviderElement<DictionaryClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DictionaryClient create(Ref ref) {
    return dictionaryClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DictionaryClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DictionaryClient>(value),
    );
  }
}

String _$dictionaryClientHash() => r'ba8d97b119dc639c3ac257fe09facf9d174e24a0';
