import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );

    _controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerBuilder(
        onEnterFullScreen: () {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.landscapeLeft]);
        },
        onExitFullScreen: () {
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          aspectRatio: 16 / 9,
          actionsPadding: const EdgeInsets.only(left: 16.0, bottom: 300),
          controller: _controller,
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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {},
            ),
          ],
        ),
        builder: (context, player) {
          return player;
        },
      ),
    );

    //     SizedBox(
    //   // width: MediaQuery.of(context).size.width,
    //   // height: 200,
    //   child: YoutubePlayer(
    //     aspectRatio: 16 / 9,
    //     controller: _controller,
    //     progressColors: const ProgressBarColors(
    //       playedColor: Colors.red,
    //       handleColor: Colors.redAccent,
    //       backgroundColor: Colors.grey,
    //     ),

    //     // topActions: [
    //     //   const SizedBox(width: 8.0),
    //     //   Expanded(
    //     //     child: Text(
    //     //       _controller.metadata.title,
    //     //       style: const TextStyle(
    //     //         color: Colors.white,
    //     //         fontSize: 18.0,
    //     //       ),
    //     //       overflow: TextOverflow.ellipsis,
    //     //       maxLines: 1,
    //     //     ),
    //     //   ),
    //     //   IconButton(
    //     //     icon: const Icon(
    //     //       Icons.settings,
    //     //       color: Colors.white,
    //     //       size: 25.0,
    //     //     ),
    //     //     onPressed: () {},
    //     //   ),
    //     // ],
    //     // bottomActions: [
    //     //   CurrentPosition(),
    //     //   ProgressBar(),
    //     //   RemainingDuration(),
    //     // ],
    //   ),
    // );
  }
}
