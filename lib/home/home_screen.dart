import 'dart:io';

import 'package:enjoy_television/constants/image_path.dart';
import 'package:enjoy_television/home/widgets/home_news_widget.dart';
import 'package:flutter/material.dart';

import '../common/drawer/drawer_widget.dart';
import '../common/tv_app_bar.dart';
import 'new_tv.dart';
import 'tv_channel_widget.dart';
import 'widgets/videos_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const TVAppBar(showSearchBtn: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Platform.isIOS ? const TvChannelWidget() : const NewTVWidget(),
            ...ImagePath.genreList.map((genre) {
              if (genre.name == 'News') {
                return const HomeNewsWidget();
              }

              return VideosWidget(path: genre.phpPath, title: genre.name);
            })
          ],
        ),
      ),
    );
  }
}
