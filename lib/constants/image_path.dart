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

  static const String shareAppText =
      'Check out this app Download it here: https://play.google.com/store/apps/details?id=net.fluidstream.enjoytelevision';

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
    Genre(
      name: 'News',
      imagePath: news,
      phpPath: 'special.php',
    ),
  ];

  static Genre newsGenre = const Genre(
    name: 'News',
    imagePath: news,
    phpPath: 'special.php',
  );
  static List<Social> socialList = const [
    Social(
      text: 'Facebook',
      imagePath: 'assets/icons/socials/facebook.png',
      url: 'https://www.facebook.com/EnjoyTelevision/',
    ),
    Social(
      text: 'Twitter',
      imagePath: 'assets/icons/socials/twitter.png',
      url: 'https://twitter.com/ENJOYTELEVISION',
    ),
    Social(
      text: 'YouTube',
      imagePath: 'assets/icons/socials/youtube.png',
      url: 'https://www.youtube.com/user/EnjoyTelevision',
    ),
    Social(
      text: 'Instagram',
      imagePath: 'assets/icons/socials/instagram.png',
      url: 'https://www.instagram.com/enjoy_television/',
    ),
    Social(
      text: 'TikTok',
      imagePath: 'assets/icons/socials/tiktok.png',
      url: 'https://www.tiktok.com/@enjoy_television',
    ),
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

class Social {
  final String text;
  final String imagePath;
  final String url;

  const Social({
    required this.text,
    required this.imagePath,
    required this.url,
  });
}
