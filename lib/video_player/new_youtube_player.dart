import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'video_player_provider.dart';

class NewYoutubePlayer extends StatefulWidget {
  const NewYoutubePlayer(
      {super.key,
      required this.videoUrl,
      this.child,
      required this.titleWidget});
  final String videoUrl;
  final Widget? child;
  final Widget titleWidget;

  @override
  State<NewYoutubePlayer> createState() => _NewYoutubePlayerState();
}

class _NewYoutubePlayerState extends State<NewYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: kDebugMode ? false : true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final videProvider = ref.watch(videPlayerProvider);

        return YoutubePlayerBuilder(
          player: YoutubePlayer(
            aspectRatio: 16 / 9,
            actionsPadding: const EdgeInsets.only(left: 16.0, bottom: 300),
            controller: YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(
                    videProvider?.videoUrl ?? widget.videoUrl)!,
                flags: const YoutubePlayerFlags(
                  mute: false,
                  autoPlay: kDebugMode ? false : true,
                  disableDragSeek: false,
                  loop: false,
                  isLive: false,
                  forceHD: false,
                  enableCaption: true,
                )),
            // _controller,
            // ..load(YoutubePlayer.convertUrlToId(widget.videoUrl)!),
            progressColors: const ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.redAccent,
              backgroundColor: Colors.grey,
            ),
            topActions: [
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.play_rectangle_fill,
                    color: Colors.red, size: 25.0),
                onPressed: () {},
              ),
            ],
          ),
          builder: (context, player) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: player),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: widget.titleWidget),
                if (widget.child != null)
                  Expanded(flex: 5, child: widget.child!),
              ],
            );
          },
        );
      },
    );
  }
}
