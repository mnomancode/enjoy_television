import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/router.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // all the async await code here

  // FlutterNativeSplash.remove();

  // runApp(ProviderScope(child: Consumer(
  //   builder: (((context, ref, child) {
  //     /// We are loading up the `database provider` here as soon as the application starts.
  //     final states = [
  //       ref.watch(sembastDatabaseProvider),
  //     ];
  //     if (states.every((state) => state is AsyncData)) {
  //       return const MaterialApp(home: MainApp());
  //     }
  //     if (states.any((state) => state is AsyncError)) {
  //       return const Center(child: Text('Error'));
  //     }
  //     return const Center(child: CircularProgressIndicator());
  //   })),
  // )));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Enjoy Television',
      themeMode: theme.mode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
