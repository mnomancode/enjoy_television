import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://enjoytelevision.com/appx-config/';

  Future<Response> getVideos(String path) async {
    try {
      final response = await _dio.get('$_baseUrl$path');
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> getNews() async {
    log('getNews');
    try {
      final response = await _dio.get(
          'https://enjoytelevision.com/wp-json/wp/v2/posts/?_fields[]=date&_fields[]=title&_fields[]=content&_fields[]=yoast_head_json&_fields[]=id');
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
