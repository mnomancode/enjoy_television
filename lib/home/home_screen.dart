import 'package:enjoy_television/constants/image_path.dart';
import 'package:flutter/material.dart';

import '../common/drawer/drawer_widget.dart';
import '../common/tv_app_bar.dart';
import 'tv_channel_widget.dart';
import 'widgets/videos_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const TVAppBar(showSearch: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TvChannelWidget(),

            ...ImagePath.genreList.map((genre) {
              if (genre.name == 'News') {
                return const Text('News');
              }

              return VideosWidget(path: genre.phpPath, title: genre.name);
            })
            // ImagePath.genreList.map(genre)=> VideosWidget(path:genre.path)).toList(),
            // VideosWidget(path: 'mob_festivals.php', title: 'Festivals & Clubs'),
            // VideosWidget(path: 'djset.php', title: 'DJset'),
            // VideosWidget(path: 'videoclip.php', title: 'Videoclip'),
            // VideosWidget(path: 'enjoytv.php', title: 'EnjoyTV'),
            // VideosWidget(path: 'interview.php', title: 'Interview'),
            // VideosWidget(path: 'special.php', title: 'Special'),
            // VideosWidget(path: 'news.php', title: 'News'),
          ],
        ),
      ),
    );
  }
}
