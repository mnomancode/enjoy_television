import 'package:flutter/material.dart';

@immutable
class ImagePath {
  const ImagePath._();

  static const String festivals = 'assets/images/genre/festivals.jpeg';
  static const String enjoyTv = 'assets/images/genre/enjoy_tv.jpeg';
  static const String djSet = 'assets/images/genre/djset.jpeg';
  static const String interview = 'assets/images/genre/interview.jpeg';
  static const String news = 'assets/images/genre/news.jpeg';
  static const String special = 'assets/images/genre/special.jpeg';
  static const String videoClip = 'assets/images/genre/video_clip.jpeg';

  static List<Genre> genreList = const [
    Genre(
      name: 'FESTIVALS & CLUBS',
      imagePath: festivals,
      phpPath: 'mob_festivals.php',
    ),
    Genre(
      name: 'DJSET',
      imagePath: djSet,
      phpPath: 'djset.php',
    ),
    Genre(
      name: 'VIDEO CLIP',
      imagePath: videoClip,
      phpPath: 'videoclip.php',
    ),
    Genre(
      name: 'ENJOY TV',
      imagePath: enjoyTv,
      phpPath: 'enjoytv.php',
    ),
    Genre(
      name: 'INTERVIEW',
      imagePath: interview,
      phpPath: 'interview.php',
    ),
    Genre(
      name: 'SPECIAL',
      imagePath: special,
      phpPath: 'special.php',
    ),
    // Genre(
    //   name: 'News',
    //   imagePath: news,
    //   phpPath: 'special.php',
    // ),
  ];
}

class Genre {
  final String name;
  final String imagePath;
  final String phpPath;

  const Genre({
    required this.name,
    required this.imagePath,
    required this.phpPath,
  });
}
