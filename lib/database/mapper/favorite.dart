import 'package:enjoy_television/database/database_impl.dart';

import '../entity/favorite.dart';

class FavoriteMapper {
  static Favorite transformToModel(FavoriteEntity entity) {
    return Favorite(
      itemId: entity.itemId,
      title: entity.title,
      imageUrl: entity.imageUrl,
      videoUrl: entity.videoUrl,
      content: entity.content,
      pagePath: entity.pagePath,
      date: entity.date,
    );
  }

  static List<Favorite> transformFavoriteModelList(
      List<FavoriteEntity> entities) {
    return entities.map((e) => transformToModel(e)).toList();
  }
}
