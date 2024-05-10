import 'package:enjoy_television/dashboard/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../video_player/video_play_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardScreen(),
      routes: [
        GoRoute(
          name: 'play-video',
          path: 'play-video',
          pageBuilder: (context, state) => MaterialPage(
              child: VidePlayerScreen(
            pageTitle: state.uri.queryParameters['pageTitle'] ?? '',
            phpPath: state.uri.queryParameters['phpPath'] ?? '',
            pageUrl: state.uri.queryParameters['pageUrl'] ?? '',
            videoUrl: state.uri.queryParameters['videoUrl'] ?? '',
            date: state.uri.queryParameters['date'] ?? '',
            title: state.uri.queryParameters['title'] ?? '',
          )),
        ),
      ],
    ),
    // GoRoute(
    //     name: 'play-video',
    //     path: '/play-video',
    //     pageBuilder: (context, state) => MaterialPage(
    //         child: VidePlayerScreen(id: state.uri.queryParameters['id']))

    //     // DialogPage(
    //     //   builder: (_) => AddCategoryScreen(
    //     //     id: state.uri.queryParameters['id'],
    //     //     name: state.uri.queryParameters['name'],
    //     //     svg: state.uri.queryParameters['svg'],
    //     //     order: int.tryParse(
    //     //         state.uri.queryParameters['order'] ?? '0'),
    //     //   ),
    //     // ),
    //     ),
  ],
);
