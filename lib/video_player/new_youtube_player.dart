import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewYoutubePlayer extends StatefulWidget {
  const NewYoutubePlayer(
      {super.key,
      required this.videoUrl,
      this.child,
      required this.titleWidget,
      required this.controller,
      this.appBar,
      this.bottomWidget});
  final String videoUrl;
  final Widget? child;
  final Widget titleWidget;
  final Widget? appBar;
  final Widget? bottomWidget;
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
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
          backgroundColor: Colors.grey,
        ),
        topActions: [
          const SizedBox(width: 8.0),
          Row(
            children: [
              widget.controller.value.isFullScreen
                  ? IconButton(
                      onPressed: () {
                        widget.controller.toggleFullScreenMode();
                      },
                      icon: const Icon(Icons.arrow_back))
                  : const SizedBox(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  widget.controller.metadata.title,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const Spacer(),
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
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                children: [
                  if (widget.appBar != null) widget.appBar!,
                  Hero(
                    tag: widget.videoUrl,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10), child: player),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8.0),
                        child: widget.titleWidget),
                  ),
                ],
              ),
            ),
            if (widget.child != null) Expanded(child: widget.child!),
            if (widget.bottomWidget != null) widget.bottomWidget!,
          ],
        );
      },
    );
  }
}
