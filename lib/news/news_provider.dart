import 'package:enjoy_television/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/dio_client.dart';

part 'news_provider.g.dart';

@Riverpod(keepAlive: true)
class NewsNotifier extends _$NewsNotifier {
  @override
  FutureOr<List<News>> build() async {
    return _fetchData();
  }

  FutureOr<List<News>> _fetchData() async {
    final response = await DioClient().getNews();
    var jsonData = AppUtils.extractNews(response.data);

    if (jsonData == null) {
      return [];
    }

    return jsonData.map<News>((e) => News.fromJson(e)).toList();
  }
}

class News {
  final String title;
  final String id;
  final String? pagePath;
  final String? date;
  final String? htmlContent;
  final String? image;
  final String? readTime;

  News({
    required this.title,
    required this.id,
    this.date,
    this.pagePath,
    this.htmlContent,
    this.image,
    this.readTime,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      id: json['id'].toString(),
      date: json['date'],
      pagePath: json['pagePath'],
      htmlContent: json['htmlContent'],
      image: json['image'],
      readTime: json['readTime'],
    );
  }
}
