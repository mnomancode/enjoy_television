import 'package:drift/drift.dart';

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get itemId => text().withLength()();
  TextColumn get title => text().withLength()();
  TextColumn get imageUrl => text().withLength().nullable()();
  TextColumn get videoUrl => text().withLength().nullable()();
  TextColumn get content => text().withLength().nullable()();
  TextColumn get pagePath => text().nullable().nullable()();
  DateTimeColumn get date => dateTime().nullable()();
}
