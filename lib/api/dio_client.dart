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
}
