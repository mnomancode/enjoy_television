import 'dart:io';

import 'package:enjoy_television/constants/image_path.dart';
import 'package:enjoy_television/home/widgets/home_news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/drawer/drawer_widget.dart';
import '../common/tv_app_bar.dart';
import 'new_tv.dart';
import 'tv_channel_widget.dart';
import 'widgets/videos_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        bool isFullScreen = orientation == Orientation.landscape;

        if (isFullScreen) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
              overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
        }

        return Scaffold(
          drawerEnableOpenDragGesture: false,
          drawer: const DrawerWidget(),
          appBar: isFullScreen ? null : const TVAppBar(showSearchBtn: true),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Platform.isIOS
                    ? const TvChannelWidget()
                    : Stack(
                        children: [
                          NewTVWidget(isFullScreen: isFullScreen),
                          if (isFullScreen)
                            Positioned(
                              left: 5,
                              top: 5,
                              child: IconButton(
                                  onPressed: () {
                                    SystemChrome.setPreferredOrientations(
                                        [DeviceOrientation.portraitUp]);
                                  },
                                  icon: Opacity(
                                    opacity: isFullScreen ? 1 : 1,
                                    child: const Icon(Icons.arrow_back,
                                        color: Colors.white, size: 30),
                                  )),
                            ),
                          Positioned(
                            right: isFullScreen ? 83 : 3,
                            bottom: isFullScreen ? 1 : 1.5,
                            child: IconButton(
                                onPressed: () {
                                  isFullScreen
                                      ? SystemChrome.setPreferredOrientations(
                                          [DeviceOrientation.portraitUp])
                                      : SystemChrome.setPreferredOrientations(
                                          [DeviceOrientation.landscapeRight]);
                                },
                                icon: Opacity(
                                  opacity: isFullScreen ? 1 : 1,
                                  child: const Icon(Icons.fullscreen,
                                      color: Colors.white, size: 30),
                                )),
                          )
                        ],
                      ),
                ...ImagePath.genreList.map((genre) {
                  if (isFullScreen) {
                    return const SizedBox();
                  }

                  if (genre.name == 'News') {
                    return const HomeNewsWidget();
                  }

                  return VideosWidget(path: genre.phpPath, title: genre.name);
                })
              ],
            ),
          ),
        );
      },
    );
  }
}
