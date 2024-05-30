// import 'package:better_player/better_player.dart';
// import 'package:flutter/material.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// class TvChannelWidget extends StatefulWidget {
//   const TvChannelWidget({super.key});

//   @override
//   State<TvChannelWidget> createState() => _TvChannelWidgetState();
// }

// class _TvChannelWidgetState extends State<TvChannelWidget> {
//   late BetterPlayerController _betterPlayerController;

//   @override
//   void initState() {
//     BetterPlayerControlsConfiguration controlsConfiguration =
//         const BetterPlayerControlsConfiguration(
//       controlBarColor: Colors.black26,
//       iconsColor: Colors.white,
//       playIcon: Icons.play_arrow_outlined,
//       progressBarPlayedColor: Colors.indigo,
//       progressBarHandleColor: Colors.indigo,
//       skipBackIcon: Icons.replay_10_outlined,
//       skipForwardIcon: Icons.forward_10_outlined,
//       backwardSkipTimeInMilliseconds: 10000,
//       forwardSkipTimeInMilliseconds: 10000,
//       enableSkips: true,
//       enableFullscreen: true,
//       enablePip: true,
//       enablePlayPause: true,
//       enableMute: true,
//       enableAudioTracks: true,
//       enableProgressText: true,
//       enableSubtitles: true,
//       showControlsOnInitialize: true,
//       enablePlaybackSpeed: true,
//       controlBarHeight: 40,
//       loadingColor: Colors.red,
//       overflowModalColor: Colors.black54,
//       overflowModalTextColor: Colors.white,
//       overflowMenuIconsColor: Colors.white,
//     );

//     BetterPlayerConfiguration betterPlayerConfiguration =
//         BetterPlayerConfiguration(
//             placeholder:
//                 const Image(image: AssetImage('assets/images/enjoy.png')),
//             controlsConfiguration: controlsConfiguration,
//             aspectRatio: 16 / 9,
//             fit: BoxFit.contain,
//             subtitlesConfiguration:
//                 const BetterPlayerSubtitlesConfiguration(fontSize: 16.0));
//     BetterPlayerDataSource dataSource = BetterPlayerDataSource(
//         BetterPlayerDataSourceType.network,
//         "https://str27.fluid.stream/EnjoyTelevision/livestream/playlist.m3u8",
//         notificationConfiguration: const BetterPlayerNotificationConfiguration(
//           showNotification: true,
//           title: "Enjoy Television",
//         ));

//     _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
//     _betterPlayerController.setupDataSource(dataSource);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: [
//           AspectRatio(
//             aspectRatio: 16 / 9,
//             child: BetterPlayer(controller: _betterPlayerController),
//           ),

//           const SizedBox(height: 10),

//           // AspectRatio(
//           //   aspectRatio: 16 / 9,
//           //   child: BetterPlayerPlaylist(
//           //       betterPlayerConfiguration: const BetterPlayerConfiguration(
//           //         placeholder:
//           //             Image(image: AssetImage('assets/icons/app_logo.png')),
//           //       ),

//           //       // bufferingConfiguration: BetterPlayerBufferingConfiguration(
//           //       //   minBufferMs: 50000,
//           //       //   maxBufferMs: 13107200,
//           //       //   bufferForPlaybackMs: 2500,
//           //       //   bufferForPlaybackAfterRebufferMs: 5000,
//           //       // ),
//           //       betterPlayerPlaylistConfiguration:
//           //           const BetterPlayerPlaylistConfiguration(),
//           //       betterPlayerDataSourceList: [
//           //         BetterPlayerDataSource(BetterPlayerDataSourceType.network,
//           //             "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
//           //             ),
//           //       ]),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// /// https://assets.afcdn.com/video49/20210722/v_645516.m3u8
// /// https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4
// /// https://str27.fluid.stream/EnjoyTelevision/livestream/playlist.m3u8