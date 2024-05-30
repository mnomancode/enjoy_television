import 'database_impl.dart';

abstract class Database {
  Stream<List<Favorite>> watchFavorite();
  Future<bool> isFavorite(String itemId);
  Future<void> addFavorite(Favorite favorite);
  Future<void> removeFavorite(String itemId);
  Future<void> clearFavorite();
}
