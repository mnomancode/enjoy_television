import 'package:dio/dio.dart';
import 'package:enjoy_television/connectivity/payment_check.dart';

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
    try {
      final response = await _dio.get(
          'https://enjoytelevision.com/wp-json/wp/v2/posts/?_fields[]=date&_fields[]=title&_fields[]=content&_fields[]=yoast_head_json&_fields[]=id');
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> search(String query, int page) async {
    final htmlResponse = await _dio
        .get('https://enjoytelevision.com/page/$page/?s=$query&Submit');

    return htmlResponse;
  }

  Future<PaymentStatus> getPaymentStatus() async {
    try {
      final response =
          await _dio.get('https://noman9k.github.io/enjoy-television.json');
      final jsonData = response.data;
      if (jsonData == null) {
        return PaymentStatus(status: 'error', message: 'Error');
      }

      return PaymentStatus(
          status: jsonData['status'],
          message: jsonData['message'],
          paymentDone: jsonData['payment']);
    } catch (e) {
      return PaymentStatus(status: 'error', message: 'Error');
    }
  }
}
