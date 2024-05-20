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

  static const String dummyHtml = r''
      "<p><img fetchpriority=\"high\" decoding=\"async\" class=\"size-full wp-image-13196 aligncenter\" src=\"https://enjoytelevision.com/wp-content/uploads/2024/05/ade-2024.png\" alt=\"\" width=\"1200\" height=\"630\" srcset=\"https://enjoytelevision.com/wp-content/uploads/2024/05/ade-2024.png 1200w, https://enjoytelevision.com/wp-content/uploads/2024/05/ade-2024-770x404.png 770w, https://enjoytelevision.com/wp-content/uploads/2024/05/ade-2024-1170x614.png 1170w, https://enjoytelevision.com/wp-content/uploads/2024/05/ade-2024-768x403.png 768w, https://enjoytelevision.com/wp-content/uploads/2024/05/ade-2024-700x368.png 700w\" sizes=\"(max-width: 1200px) 100vw, 1200px\" /></p>\n<p>Amsterdam Dance Event (ADE) welcomed a record number of 500,000 visitors throughout its Festival and Conferences, which took place over five days and nights. Next year’s edition of ADE will take place October 16—20, 2024. The 28th edition of the Amsterdam Dance Event has come to an end, hosting 2,900+ artists at over 1,000 events and initiatives taking place in over 200 locations across the city, and welcoming a record number of 500,000 global visitors and 650,000 sold tickets. ADE has grown to become the most important and influential breeding ground for electronic music culture and talent. This year’s program showcased a wide array of electronic music subgenres, live music and cultural crossovers throughout its Festival and Arts &amp; Culture programs, focusing on a diverse and inclusive offering both in terms of artist roster and audiences. Standout events included the opening event at Rijksmuseum by upsammy, Metropole Orkest &amp; Tinlicker, a one-off b2b between KI/KI and Armin van Buuren, and social impact events by Music Moves. Familiar staples such as Speedy J’s STOOR, Audio Obscura, Martin Garrix’ 18+ and All Ages events, also saw their return to ADE, alongside new collaborations such as Andalusisch Orkest x Mary Lake and Het HEM x Horst. ADE Pro Conference In addition to the enormous variety of sold out festival events, the ADE Pro Conference extended its programming to four days for the first time this year. The conference welcomed global artists and influential companies to Felix Meritis to cover the strategies, opportunities and responsibilities that define the music industry. Global industry leaders and tech experts at Google, TuneCore, SEG and more envisioned the enormous impact of Artificial Intelligence, and platforms including Spotify, TikTok, YouTube and Beatport offered real insider knowledge to attendees. The new ADE Startups also kicked off a year-long development platform for innovative startups, and international event organisers gathered for a deep discussion on the future of festivals. In addition, the conference invited world class artists on stage, including DJ icon Grandmaster Flash, The Blessed Madonna, Röyksopp and Max Cooper &#8211; with the latter two also hosting one-off live performances for all conference attendees. ADE Lab, the talent development gathering for young artists and professionals, saw a hugely successful sophomore edition, nurturing and supporting the next generation in electronic music. Over 2,000 young artists, producers and aspiring professionals learned from world class artists including Reinier Zonneveld, Mama Snake, Saoirse, Héctor Oaks and A-Trak, create music together with newfound connections, receive feedback on their work, and compete in demo drops. _________________________________________________________________________ The Amsterdam Dance Event Foundation is a not-for-profit organisation dedicated to nurturing electronic music, its culture and its industry worldwide. The organisation devotes itself to stimulating development, innovation and talent, gathering the global industry and laying a foundation for future generations. About ADE The Amsterdam Dance Event (ADE), an initiative of Buma, has grown into the world’s largest and most influential club-based festival and conference for electronic music. The event continues to grow and develop each year, featuring over 2,900 artists throughout 1,000+ events in over 200 venues. The five-day event attracts over 500,000 visitors from over 150 countries and features every conceivable aspect of electronic music culture, with dedicated conference programming, an extensive Arts &amp; Culture programme, live music and DJ/artist performances, all spread across the city of Amsterdam. More information about ADE can be found here. ADE – Electronic Music Gathers Here The Amsterdam Dance Event is organised by The Amsterdam Dance Event Foundation. Founding partner: Buma Main partners: Heineken 0.0 | Desperados</p>\n";
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
