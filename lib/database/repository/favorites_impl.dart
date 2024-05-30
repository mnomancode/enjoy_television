import 'package:enjoy_television/database/database_impl.dart';
import 'package:enjoy_television/database/mapper/favorite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database.dart';
import 'favorites.dart';

part 'favorites_impl.g.dart';

@riverpod
class FavoriteRepositoryImpl extends _$FavoriteRepositoryImpl
    implements FavoriteRepository {
  // ignore: avoid_public_notifier_properties, avoid_manual_providers_as_generated_provider_dependency
  late final Database database = ref.read(databaseProvider);

  @override
  Stream<List<Favorite>> build() {
    return database
        .watchFavorite()
        .map(FavoriteMapper.transformFavoriteModelList);
  }

  @override
  Future<void> addFavorite(
      {required String itemId,
      required String title,
      String? imageUrl,
      String? videoUrl,
      String? content,
      String? pagePath,
      DateTime? date}) {
    final favorite = Favorite(
      itemId: itemId,
      title: title,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      content: content,
      pagePath: pagePath,
      date: date,
    );

    return database.addFavorite(favorite);
  }

  @override
  Future<void> clearFavorite() {
    return database.clearFavorite();
  }

  @override
  Future<bool> isFavorite(String itemId) {
    return database.isFavorite(itemId);
  }

  @override
  Future<void> removeFavorite(String itemId) {
    return database.removeFavorite(itemId);
  }

  @override
  Stream<List<Favorite>> watchFavorite() {
    return database
        .watchFavorite()
        .map(FavoriteMapper.transformFavoriteModelList);
  }

  getFavorites() {
    return database.watchFavorite().listen((event) {
      event.map((e) => print(e));
    });
  }
}
