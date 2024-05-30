import '../database_impl.dart';

abstract class FavoriteRepository {
  Stream<List<Favorite>> watchFavorite();
  Future<bool> isFavorite(String itemId);
  Future<void> addFavorite(
      {required String itemId,
      required String title,
      String? imageUrl,
      String? videoUrl,
      String? content,
      String? pagePath,
      DateTime? date});
  Future<void> removeFavorite(String itemId);
  Future<void> clearFavorite();
}
