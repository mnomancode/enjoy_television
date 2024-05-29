import 'dart:developer';

import 'package:enjoy_television/models/data_model.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../api/dio_client.dart';
import '../../news/news_provider.dart';
import '../../utils/utils.dart';

part 'updates_provider.g.dart';

@Riverpod(keepAlive: true)
class UpdatesNotifier extends _$UpdatesNotifier {
  @override
  FutureOr<List<UpdatesItem>> build() async {
    return _fetchData();
  }

  FutureOr<List<UpdatesItem>> _fetchData() async {
    List<DataModel> videos = await _fetchVideos();
    List<News> news = await _fetchNews();

    List<UpdatesItem> updates = [];

    for (var video in videos) {
      updates.add(UpdatesItem(
        title: video.title,
        id: YoutubePlayer.convertUrlToId(video.videoUrl) ?? '',
        pagePath: video.pagePath,
        date: video.date,
        image: video.imageUrl,
        videoUrl: video.videoUrl,
        category: video.category,
      ));
    }

    for (var newsItem in news) {
      updates.add(UpdatesItem(
        title: newsItem.title,
        id: newsItem.id,
        pagePath: newsItem.pagePath,
        date: newsItem.date,
        image: newsItem.image,
        readTime: newsItem.readTime,
        htmlContent: newsItem.htmlContent,
        category: 'NEWS',
        isNews: true,
      ));
    }

    updates.sort((a, b) {
      DateTime aDate = DateTime.now();
      DateTime bDate = DateTime.now();

      aDate = DateTime.tryParse(a.date!) ?? DateTime.now();

      bDate = DateTime.tryParse(b.date!) ?? DateTime.now();

      return bDate.compareTo(aDate);
    });

    // updates.sort((a, b) {
    //   DateTime aDate = DateTime.now();
    //   DateTime bDate = DateTime.now();

    //   log('A: ${a.date}');
    //   log('B: ${b.date}');

    //   try {
    //     if (a.isNews) {
    //       aDate = DateTime.tryParse(a.date!) ?? DateTime.now();
    //     } else {
    //       aDate =
    //           DateFormat('dd MMMM yyyy').tryParse(a.date!) ?? DateTime.now();
    //     }

    //     if (b.isNews) {
    //       bDate = DateTime.tryParse(b.date!) ?? DateTime.now();
    //     } else {
    //       bDate =
    //           DateFormat('dd MMMM yyyy').tryParse(b.date!) ?? DateTime.now();
    //     }
    //   } catch (e) {
    //     log('Error: $e');
    //   }

    //   return bDate.compareTo(aDate);
    // });

    return updates;
  }

  FutureOr<List<DataModel>> _fetchVideos() async {
    DioClient dioClient = DioClient();
    var response = await dioClient.getVideos('mob_updates.php');

    var jsonData = AppUtils.extractData('mob_updates.php', response.data);

    if (jsonData == null) {
      return [];
    }

    return jsonData.map<DataModel>((e) => DataModel.fromJson(e)).toList();
  }

  FutureOr<List<News>> _fetchNews() async {
    final response = await DioClient().getNews();
    var jsonData = AppUtils.extractNews(response.data);

    if (jsonData == null) {
      return [];
    }

    return jsonData.map<News>((e) => News.fromJson(e)).toList();
  }
}

class UpdatesItem {
  final String title;
  final String id;
  final String? pagePath;
  final String? date;
  final String? htmlContent;
  final String? image;
  final String? readTime;
  final String? videoUrl;
  final String? category;

  final bool isNews;

  UpdatesItem({
    required this.title,
    required this.id,
    this.date,
    this.pagePath,
    this.htmlContent,
    this.image,
    this.readTime,
    this.videoUrl,
    this.category,
    this.isNews = false,
  });
}
