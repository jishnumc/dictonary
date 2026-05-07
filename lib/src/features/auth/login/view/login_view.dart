import 'package:dictonary/src/app_ui/app_ui.dart';
import 'package:dictonary/src/features/auth/login/models/login_validation.dart';
import 'package:dictonary/src/features/auth/login/state/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(loginProvider.notifier).login();
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    final isLoading = loginState.isLoggingIn;
    final colors = context.zAppColors;
    final textTheme = context.zTextTheme;
    final notifier = ref.read(loginProvider.notifier);

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.xxxl * 2),
                Icon(Icons.menu_book_rounded, size: 80, color: colors.primary),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  'Welcome Back',
                  style: textTheme.headlineLarge?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Login to continue using the dictionary app',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xxl),
                AppTextField(
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                  prefixIcon: const Icon(Icons.email_outlined),
                  initialValue: loginState.username,
                  onChanged: (value) => notifier.updateUsername(value),
                  validator: (value) => switch (notifier.validateEmail(value ?? '')) {
                    Valid() => null,
                    Invalid(:final message) => message,
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  initialValue: loginState.password,
                  onChanged: (value) => notifier.updatePassword(value),
                  validator: (value) => switch (notifier.validatePassword(value ?? '')) {
                    Valid() => null,
                    Invalid(:final message) => message,
                  },
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppButton(
                  text: 'Login',
                  isLoading: isLoading,
                  onPressed: _onLogin,
                ),
                if (loginState.errorMessage.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    loginState.errorMessage,
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Navigate to Sign Up
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
