import 'package:dictonary/src/features/auth/_self/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A [ChangeNotifier] that triggers a router redirect whenever the
/// authentication state changes.
class RouterListenable extends ChangeNotifier {
  RouterListenable(this.ref) {
    ref.listen(
      authProvider,
      (previous, next) {
        if (previous != next) {
          notifyListeners();
        }
      },
    );
  }

  final Ref ref;
}
