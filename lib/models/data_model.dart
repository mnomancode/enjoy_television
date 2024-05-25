import 'dart:convert';
import 'dart:developer';

import 'package:enjoy_television/api/dio_client.dart';
import 'package:enjoy_television/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

// @riverpod
// FutureOr<List<DataModel>> fetchVideos(DataModelRef ref) async {
//   DioClient dioClient = DioClient();
//   var response = await dioClient.getVideos('video.php');

//   var jsonData = AppUtils.extractData('', response.data);
//   ref.keepAlive();

//   return jsonData!.map<DataModel>((e) => DataModel.fromJson(e)).toList();
// }

@Riverpod(keepAlive: true)
class DataModelNotifier extends _$DataModelNotifier {
  @override
  FutureOr<List<DataModel>> build(
    String path,
  ) async {
    return _fetchData(path);
  }

  FutureOr<List<DataModel>> _fetchData(String path) async {
    DioClient dioClient = DioClient();
    var response = await dioClient.getVideos(path);

    var jsonData = AppUtils.extractData(path, response.data);

    if (jsonData == null) {
      log('jsonData is null');
      return [];
    }

    List<DataModel> data =
        jsonData.map<DataModel>((e) => DataModel.fromJson(e)).toList();

    data.forEach((element) {
      log('path $path ${element.pagePath}');
    });

    return jsonData.map<DataModel>((e) => DataModel.fromJson(e)).toList();
  }
}

@riverpod
AsyncValue<List<DataModel>>? getVideos(GetVideosRef ref, String path) {
  var response = ref.read(dataModelNotifierProvider(path));

  return response;
}

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    required String title,
    required String imageUrl,
    required String videoUrl,
    String? date,
    String? pagePath,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}



// @riverpod
// class ActivityNotifier2 extends _$ActivityNotifier2 {
//   /// Notifier arguments are specified on the build method.
//   /// There can be as many as you want, have any name, and even be optional/named.
//   @override
//   Future<Activity> build(String activityType) async {
//     // Arguments are also available with "this.<argumentName>"
//     print(this.activityType);

//     // TODO: perform a network request to fetch an activity
//     return fetchActivity();
//   }
// }
