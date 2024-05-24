import 'package:enjoy_television/constants/image_path.dart';
import 'package:enjoy_television/dashboard/screens/dashboard_screen.dart';
import 'package:enjoy_television/genre/genre_vieos_screen.dart';
import 'package:enjoy_television/news/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../news/news_read_screen.dart';
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
            isFavorite: state.uri.queryParameters['isFavorite'] == 'true',
            imageUrl: state.uri.queryParameters['imageUrl'] ?? '',
          )),
        ),
        GoRoute(
            name: 'genre-videos-screen',
            path: 'genre-videos-screen',
            pageBuilder: (context, state) {
              Genre genre = state.extra as Genre;
              return MaterialPage(child: GenreVideosScreen(genre: genre));
            }),
        GoRoute(
            name: 'genre-news-screen',
            path: 'genre-news-screen',
            pageBuilder: (context, state) {
              return const MaterialPage(child: NewsScreen());
            },
            routes: [
              GoRoute(
                name: 'news-read-screen',
                path: 'news-read-screen',
                pageBuilder: (context, state) {
                  var queryParameters = state.uri.queryParameters;

                  return MaterialPage(
                      child: NewsReadScreen(
                    id: queryParameters['id'] ?? '',
                    title: queryParameters['title'] ?? '',
                    content: queryParameters['content'] ?? '',
                    date: queryParameters['date'] ?? '',
                  ));
                },
              ),
            ]),
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
