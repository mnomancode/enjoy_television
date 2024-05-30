import 'package:enjoy_television/loading_widgets/app_shimmer.dart';
import 'package:enjoy_television/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../common/favourite_widget.dart';
import '../models/data_model.dart';
import '../video_player/new_youtube_player.dart';

class SearchPlayVideoScreen extends StatelessWidget {
  const SearchPlayVideoScreen(
      {super.key,
      required this.title,
      required this.date,
      required this.postUrl});
  final String title;
  final String date;
  final String postUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: AppUtils().getVideoUrl(postUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    AppBar(title: Text(title)),
                    const AspectRatio(
                      aspectRatio: 16 / 9,
                      child: AppShimmer(height: 200, width: double.infinity),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      child: AppShimmer(height: 50, width: double.infinity),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error loading video'),
                ),
              );

              return const Text('Error');
            }

            return MyPlayer(
                videoId: snapshot.data.toString(),
                title: title,
                videoUrl: snapshot.data);
          }),
    );
  }
}

class MyPlayer extends StatefulWidget {
  const MyPlayer({super.key, required this.videoId, this.title, this.videoUrl});
  final String videoId;
  final String? title;
  final String? videoUrl;

  @override
  State<MyPlayer> createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  late YoutubePlayerController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NewYoutubePlayer(
      controller: _controller,
      videoUrl: 'https://www.youtube.com/watch?v=${widget.videoId}',
      appBar: AppBar(title: Text(widget.title ?? '')),
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Center(
            child: Image.asset('assets/images/playing_video.png',
                width: MediaQuery.of(context).size.width * 0.6)),
      ),
      titleWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 80,
            child: Text(
              widget.title ?? widget.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 3,
            ),
          ),
          const Spacer(),
          FavoriteWidget(
              widget.videoId,
              DataModel(
                title: widget.title ?? '',
                imageUrl: YoutubePlayer.getThumbnail(videoId: widget.videoId),
                videoUrl: 'https://www.youtube.com/watch?v=${widget.videoId}',
              ),
              null),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share(
                'I watched this video on enjoytelevision.com app. Do check it out: ${widget.title ?? widget.title ?? ''}\n https://www.youtube.com/watch?v=${widget.videoId}}',
              );
            },
          ),
        ],
      ),
    );
  }
}
