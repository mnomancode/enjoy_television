import 'package:enjoy_television/api/dio_client.dart';
import 'package:enjoy_television/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

@Riverpod(keepAlive: true)
class DataModelNotifier extends _$DataModelNotifier {
  @override
  FutureOr<List<DataModel>> build() async {
    return _fetchData();
  }

  FutureOr<List<DataModel>> _fetchData() async {
    DioClient dioClient = DioClient();
    var response = await dioClient.getVideos('video.php');

    var jsonData = AppUtils.extractData(response.data);

    return jsonData.map<DataModel>((e) => DataModel.fromJson(e)).toList();
  }
}

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    required String title,
    required String imageUrl,
    required String videoUrl,
    required String date,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
