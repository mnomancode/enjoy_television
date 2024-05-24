import 'package:drift/drift.dart';
import 'package:enjoy_television/database/favoutires/favorite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connection.dart' as connection;
import 'database.dart';

part 'database_impl.g.dart';

final databaseProvider = Provider<Database>(
  (ref) => DatabaseImpl(
    dbName: 'database.db',
    inMemory: false,
    logStatements: false,
  ),
);

@DriftDatabase(tables: [Favorites])
class DatabaseImpl extends _$DatabaseImpl implements Database {
  DatabaseImpl({
    required this.dbName,
    required this.inMemory,
    required this.logStatements,
  }) : super(connection.connect(
          dbName,
          inMemory: inMemory,
          logStatements: logStatements,
        ));
  final String dbName;
  final bool inMemory;
  final bool logStatements;

  @override
  int get schemaVersion => 1;

  @override
  Future<void> addFavorite(Favorite favorite) {
    return into(favorites).insert(favorite);
  }

  @override
  Future<void> clearFavorite() {
    return delete(favorites).go();
  }

  @override
  Future<bool> isFavorite(String itemId) {
    var q =
        (select(favorites)..where((tbl) => tbl.itemId.equals(itemId))).get();
    return q.then((value) => value.isNotEmpty);
  }

  @override
  Future<void> removeFavorite(String itemId) {
    return (delete(favorites)..where((tbl) => tbl.itemId.equals(itemId))).go();
  }

  @override
  Stream<List<Favorite>> watchFavorite() {
    return select(favorites).watch();
  }
}
