// ignore_for_file: prefer_const_constructors

import 'package:enjoy_television/video_player/new_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../home/widgets/grid_videos_widget.dart';
import 'video_player_provider.dart';

class VidePlayerScreen extends ConsumerWidget {
  const VidePlayerScreen(
      {super.key,
      required this.pageTitle,
      required this.phpPath,
      this.pageUrl,
      this.title,
      required this.videoUrl,
      required this.date});
  final String? pageTitle;
  final String phpPath;
  final String? pageUrl;
  final String videoUrl;
  final String date;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videProvider = ref.watch(videPlayerProvider);

    return OrientationBuilder(builder: (context, orientation) {
      final bool isFullScreen = orientation == Orientation.landscape;

      return Scaffold(
        appBar: isFullScreen
            ? null
            : AppBar(
                title: Text(pageTitle ?? '',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
        body: NewYoutubePlayer(
            videoUrl: videProvider?.videoUrl ?? videoUrl,
            titleWidget: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 80,
                  child: Text(
                    videProvider?.title ?? title ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 2,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(Icons.favorite_border_sharp),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
            child: GridVideosWidget(path: phpPath, title: 'More Videos...')),
      );
    });
  }
}
