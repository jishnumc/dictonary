import 'package:dictonary/src/outer_layer/models/dictionary/dictionary_entry.dart';
import 'package:dictonary/src/outer_layer/repositories/dictionary/dictionary_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dictionary_notifier.g.dart';

@riverpod
class DictionaryNotifier extends _$DictionaryNotifier {
  @override
  FutureOr<List<DictionaryEntry>?> build() {
    return null;
  }

  Future<void> search(String word) async {
    if (word.isEmpty) {
      state = const AsyncData(null);
      return;
    }

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(dictionaryRepositoryProvider).getDefinition(word));
  }
}
