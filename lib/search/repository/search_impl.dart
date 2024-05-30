import 'package:enjoy_television/api/dio_client.dart';
import 'package:enjoy_television/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_impl.g.dart';

@Riverpod(keepAlive: true)
class SearchRepositoryImpl extends _$SearchRepositoryImpl {
  @override
  FutureOr<SearchResult?> build({required String query, int page = 1}) async {
    try {
      DioClient dioClient = DioClient();
      final response = await dioClient.search(query, page);
      if (response.statusCode == 200) {
        return AppUtils.parseSearchResult(response.data);
      } else {
        return null;
      }
    } on Exception {
      rethrow;
    }
  }
}

class SearchResult {
  final String title;
  final List<VideoItem>? data;
  int currentPage = 1;
  int totalPages;
  String? pageString;

  SearchResult({
    required this.title,
    this.data,
    required this.totalPages,
    this.pageString,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      title: json['title'],
      data: json['data'] != null
          ? List<VideoItem>.from(
              json['data'].map((video) => VideoItem.fromJson(video)))
          : null,
      totalPages: json['totalPages'],
      pageString: json['pageString'],
    );
  }
}

class VideoItem {
  final String title;
  final String date;
  final String postUrl;

  VideoItem({
    required this.title,
    required this.date,
    required this.postUrl,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      title: json['title'],
      date: json['date'],
      postUrl: json['postUrl'],
    );
  }
}
