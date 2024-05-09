// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../home/widgets/grid_videos_widget.dart';
import '../home/widgets/videos_widget.dart';

class VidePlayerScreen extends StatefulWidget {
  const VidePlayerScreen(
      {super.key,
      this.title,
      this.pageUrl,
      required this.videoUrl,
      required this.date});
  final String? title;
  final String? pageUrl;
  final String videoUrl;
  final String date;

  @override
  State<VidePlayerScreen> createState() => _VidePlayerScreenState();
}

class _VidePlayerScreenState extends State<VidePlayerScreen> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  bool _isFullScreen = false;

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
      ),
    )..addListener(listener);

    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              title: Text(widget.title!),
              actions: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
      body: YoutubePlayerBuilder(
        onEnterFullScreen: () {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.landscapeLeft]);
          setState(() {
            _isFullScreen = true;
          });
        },
        onExitFullScreen: () {
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          setState(() {
            _isFullScreen = false;
          });
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
          return Column(
            children: [
              Expanded(flex: 2, child: player),
              Expanded(
                flex: 5,
                child: GridVideosWidget(
                    path: 'mob_festivals.php', title: 'Festivals & Clubs'),
              ),
            ],
          );
        },
      ),
    );
  }
}
