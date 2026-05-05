import 'package:dictonary/src/app.dart';
import 'package:dictonary/src/bootstrap.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  final node = UncontrolledProviderScope(
    container: await bootstrap(),
    child: const App(),
  );

  runApp(node);
}
