import 'dart:developer';

import 'package:enjoy_television/connectivity/app_conectivity.dart';
import 'package:enjoy_television/connectivity/payment_check.dart';
import 'package:enjoy_television/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifications/notify_help.dart';
import 'router/router.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await NotificationHelper().initializeNotification();

  runApp(
    ProviderScope(
      child: Consumer(builder: (((context, ref, child) {
        final appConnectivity = ref.watch(connectivityStatusProviders);

        if (appConnectivity == ConnectivityStatus.isDisconnected) {
          log('Disconnected');

          return const MaterialApp(home: NoInternet());
        }

        if (appConnectivity == ConnectivityStatus.isConnected) {
          return const MaterialApp(home: MyApp());
        }
        return const MaterialApp(home: NoInternet());
      }))),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Enjoy Television',
      themeMode: theme.mode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No Internet Connection'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}



// https://enjoytelevision.com/wp-json/wp/v2/posts/?_fields[]=author&_fields[]=id&_fields[]=title&_fields[]=link&_fields[]=content