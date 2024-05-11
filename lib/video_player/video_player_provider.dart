import 'package:enjoy_television/models/data_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'video_player_provider.g.dart';

@riverpod
class VidePlayer extends _$VidePlayer {
  @override
  DataModel? build() {
    return null;
  }

  void updateDataModel(DataModel dataModel,
      {YoutubePlayerController? controller}) {
    state = dataModel;
    if (controller != null) {
      controller.load(YoutubePlayer.convertUrlToId(dataModel.videoUrl)!);
    }
  }
}
