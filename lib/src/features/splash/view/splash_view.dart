import 'package:dictonary/src/app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeIn)),
    );

    _controller.forward();

    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.zAppColors;
    final textTheme = context.zTextTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      size: 100,
                      color: colors.primary,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Dictionary',
                      style: textTheme.headlineLarge?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Your personal language guide',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
