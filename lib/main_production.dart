import 'package:dictonary/src/app.dart';
import 'package:dictonary/src/bootstrap.dart';
import 'package:dictonary/src/system/flavor.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  final node = UncontrolledProviderScope(
    container: await bootstrap(AppFlavor.production),
    child: const App(),
  );

  runApp(node);
}
