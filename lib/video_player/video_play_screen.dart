import 'package:enjoy_television/common/favourite_widget.dart';
import 'package:enjoy_television/models/data_model.dart';
import 'package:enjoy_television/video_player/new_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../home/widgets/grid_videos_widget.dart';
import 'video_player_provider.dart';

class VidePlayerScreen extends ConsumerStatefulWidget {
  const VidePlayerScreen({
    super.key,
    required this.pageTitle,
    required this.phpPath,
    this.pageUrl,
    this.title,
    required this.videoUrl,
    this.isFavorite = false,
    required this.date,
    required this.imageUrl,
  });
  final String? pageTitle;
  final String phpPath;
  final String? pageUrl;
  final String videoUrl;
  final String imageUrl;
  final String date;
  final String? title;
  final bool? isFavorite;

  @override
  ConsumerState<VidePlayerScreen> createState() => _VidePlayerScreenState();
}

class _VidePlayerScreenState extends ConsumerState<VidePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final videProvider = ref.watch(videPlayerProvider);

    return OrientationBuilder(builder: (context, orientation) {
      final bool isFullScreen = orientation == Orientation.landscape;
      final isIpad = MediaQuery.of(context).size.width > 600;

      return Scaffold(
        appBar: isFullScreen
            ? null
            : AppBar(
                title: Text(widget.pageTitle ?? '',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
        body: NewYoutubePlayer(
          controller: _controller,
          videoUrl: videProvider?.videoUrl ?? widget.videoUrl,
          titleWidget: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 80,
                child: Text(
                  videProvider?.title ?? widget.title ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: isIpad ? 18 : null,
                        fontWeight: isIpad ? FontWeight.bold : null,
                      ),
                  maxLines: 3,
                ),
              ),
              const Spacer(),
              FavoriteWidget(
                  YoutubePlayer.convertUrlToId(widget.videoUrl)!,
                  DataModel(
                    title: widget.title ?? '',
                    imageUrl: widget.imageUrl,
                    videoUrl: widget.videoUrl,
                    pagePath: widget.phpPath,
                    date: widget.date,
                  ),
                  null),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  Share.share(
                    'I watched this video on enjoytelevision.com app. Do check it out: ${videProvider?.title ?? widget.title ?? ''}\n${videProvider?.title ?? widget.videoUrl}',
                  );
                },
              ),
            ],
          ),
          child: widget.isFavorite!
              ? Center(
                  child: Image.asset('assets/images/playing_video.png',
                      width: MediaQuery.of(context).size.width * 0.6))
              : GridVideosWidget(
                  controller: _controller,
                  path: widget.phpPath,
                  title: 'Continue Watching'),
        ),
      );
    });
  }
}
