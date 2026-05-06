import 'dart:async';

import 'package:dictonary/src/app_ui/app_ui.dart';
import 'package:dictonary/src/features/home/state/dictionary_notifier.dart';
import 'package:dictonary/src/outer_layer/models/dictionary/dictionary_entry.dart';
import 'package:dictonary/src/outer_layer/models/dictionary/dictionary_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearch() {
    final query = _searchController.text.trim();
    ref.read(dictionaryProvider.notifier).search(query);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.zAppColors;
    final textTheme = context.zTextTheme;
    final dictionaryState = ref.watch(dictionaryProvider);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(title: const Text('Dictionary')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 300), () {
                  _onSearch();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for a word...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {
                          _searchController.clear();
                          _onSearch();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                ),
                filled: true,
                fillColor: colors.primary.withValues(alpha: 0.05),
              ),
              onSubmitted: (_) => _onSearch(),
            ),
            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: dictionaryState.when(
                data: (results) {
                  if (results == null || _searchController.text.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            size: 80,
                            color: colors.primary.withValues(alpha: 0.2),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            'Search for a word to get started',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colors.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (results.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history_rounded,
                            size: 64,
                            color: colors.onSurface.withValues(alpha: 0.2),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          const Text('No definitions found for this word.'),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: results.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: AppSpacing.xl),
                    itemBuilder: (context, index) {
                      final entry = results[index];
                      return _DictionaryEntryWidget(entry: entry);
                    },
                  );
                },
                loading: () => Skeletonizer(
                  enabled: true,
                  child: ListView.separated(
                    itemCount: 3,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: AppSpacing.xl),
                    itemBuilder: (context, index) => _DictionaryEntryWidget(
                      entry: DictionaryEntry(
                        word: 'Loading word',
                        meanings: [
                          Meaning(
                            partOfSpeech: 'noun',
                            definitions: [
                              Definition(
                                definition:
                                    'Loading definition text that is quite long to show skeleton properly. '
                                    'This will be replaced by the actual data.',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                error: (e, _) {
                  if (e is DictionaryException) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xl),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sentiment_dissatisfied_rounded,
                              size: 64,
                              color: colors.error.withValues(alpha: 0.5),
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            Text(
                              e.error.title,
                              style: textTheme.titleLarge?.copyWith(
                                color: colors.error,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              e.error.message,
                              style: textTheme.bodyMedium?.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            if (e.error.resolution.isNotEmpty) ...[
                              const SizedBox(height: AppSpacing.lg),
                              Text(
                                e.error.resolution,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colors.onSurface.withValues(
                                    alpha: 0.5,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          color: colors.error,
                          size: 48,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          'Something went wrong',
                          style: textTheme.titleMedium?.copyWith(
                            color: colors.error,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          e.toString(),
                          style: textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DictionaryEntryWidget extends StatelessWidget {
  const _DictionaryEntryWidget({required this.entry});

  final DictionaryEntry entry;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.zTextTheme;
    final colors = context.zAppColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                entry.word,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.primary,
                ),
              ),
            ),
            if (entry.phonetic != null)
              Text(
                entry.phonetic!,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.primary.withValues(alpha: 0.7),
                  fontStyle: FontStyle.italic,
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        ...entry.meanings.map(
          (meaning) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppSpacing.xs),
                      ),
                      child: Text(
                        meaning.partOfSpeech,
                        style: textTheme.labelMedium?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                ...meaning.definitions.map(
                  (def) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          def.definition,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colors.onSurface,
                            height: 1.4,
                          ),
                        ),
                        if (def.example != null)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: AppSpacing.md,
                              top: AppSpacing.xs,
                            ),
                            child: Text(
                              '"${def.example}"',
                              style: textTheme.bodyMedium?.copyWith(
                                fontStyle: FontStyle.italic,
                                color: colors.onSurface.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
