import 'package:flutter/material.dart';

import 'tv_channel_widget.dart';
import 'widgets/videos_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Image.asset('assets/icons/logo.png', height: 50),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TvChannelWidget(),
            VideosWidget(path: 'mob_festivals.php', title: 'Festivals & Clubs'),
            VideosWidget(path: 'djset.php', title: 'DJset'),
            VideosWidget(path: 'videoclip.php', title: 'Videoclip'),
            VideosWidget(path: 'enjoytv.php', title: 'EnjoyTV'),
            VideosWidget(path: 'interview.php', title: 'Interview'),
            VideosWidget(path: 'special.php', title: 'Special'),
            // VideosWidget(path: 'news.php', title: 'News'),
          ],
        ),
      ),
    );
  }
}
