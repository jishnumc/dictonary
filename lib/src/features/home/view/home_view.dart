import 'package:dictonary/src/app_ui/app_ui.dart';
import 'package:dictonary/src/features/auth/_self/auth_notifier.dart';
import 'package:dictonary/src/outer_layer/models/auth/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.zAppColors;
    final textTheme = context.zTextTheme;
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: const Text('Dictionary'),
        actions: [
          IconButton(
            onPressed: () => ref.read(authProvider.notifier).logout(),
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home_rounded,
                size: 64,
                color: colors.primary,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Welcome!',
                style: textTheme.headlineMedium?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              authState.when(
                data: (user) => user.when(
                  authenticated: (id, username) => Text(
                    'Logged in as $username',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  unauthenticated: () => const SizedBox.shrink(),
                ),
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text(
                  'Error: $e',
                  style: TextStyle(color: colors.error),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
