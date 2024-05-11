import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewYoutubePlayer extends StatefulWidget {
  const NewYoutubePlayer(
      {super.key,
      required this.videoUrl,
      this.child,
      required this.titleWidget,
      required this.controller});
  final String videoUrl;
  final Widget? child;
  final Widget titleWidget;
  final YoutubePlayerController controller;

  @override
  State<NewYoutubePlayer> createState() => _NewYoutubePlayerState();
}

class _NewYoutubePlayerState extends State<NewYoutubePlayer> {
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        aspectRatio: 16 / 9,
        actionsPadding: const EdgeInsets.only(left: 16.0, bottom: 300),
        controller: widget.controller,
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
              widget.controller.metadata.title,
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
            if (widget.child != null) Expanded(flex: 5, child: widget.child!),
          ],
        );
      },
    );
  }
}
