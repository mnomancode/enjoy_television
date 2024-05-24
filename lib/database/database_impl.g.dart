// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_impl.dart';

// ignore_for_file: type=lint
class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _videoUrlMeta =
      const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _pagePathMeta =
      const VerificationMeta('pagePath');
  @override
  late final GeneratedColumn<String> pagePath = GeneratedColumn<String>(
      'page_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, itemId, title, imageUrl, videoUrl, content, pagePath, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('page_path')) {
      context.handle(_pagePathMeta,
          pagePath.isAcceptableOrUnknown(data['page_path']!, _pagePathMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      videoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_url']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      pagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}page_path']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int? id;
  final String itemId;
  final String title;
  final String? imageUrl;
  final String? videoUrl;
  final String? content;
  final String? pagePath;
  final DateTime? date;
  const Favorite(
      {this.id,
      required this.itemId,
      required this.title,
      this.imageUrl,
      this.videoUrl,
      this.content,
      this.pagePath,
      this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['item_id'] = Variable<String>(itemId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || videoUrl != null) {
      map['video_url'] = Variable<String>(videoUrl);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || pagePath != null) {
      map['page_path'] = Variable<String>(pagePath);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      itemId: Value(itemId),
      title: Value(title),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      videoUrl: videoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(videoUrl),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      pagePath: pagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(pagePath),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int?>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      title: serializer.fromJson<String>(json['title']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      videoUrl: serializer.fromJson<String?>(json['videoUrl']),
      content: serializer.fromJson<String?>(json['content']),
      pagePath: serializer.fromJson<String?>(json['pagePath']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'itemId': serializer.toJson<String>(itemId),
      'title': serializer.toJson<String>(title),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'videoUrl': serializer.toJson<String?>(videoUrl),
      'content': serializer.toJson<String?>(content),
      'pagePath': serializer.toJson<String?>(pagePath),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  Favorite copyWith(
          {Value<int?> id = const Value.absent(),
          String? itemId,
          String? title,
          Value<String?> imageUrl = const Value.absent(),
          Value<String?> videoUrl = const Value.absent(),
          Value<String?> content = const Value.absent(),
          Value<String?> pagePath = const Value.absent(),
          Value<DateTime?> date = const Value.absent()}) =>
      Favorite(
        id: id.present ? id.value : this.id,
        itemId: itemId ?? this.itemId,
        title: title ?? this.title,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        videoUrl: videoUrl.present ? videoUrl.value : this.videoUrl,
        content: content.present ? content.value : this.content,
        pagePath: pagePath.present ? pagePath.value : this.pagePath,
        date: date.present ? date.value : this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('content: $content, ')
          ..write('pagePath: $pagePath, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, itemId, title, imageUrl, videoUrl, content, pagePath, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.title == this.title &&
          other.imageUrl == this.imageUrl &&
          other.videoUrl == this.videoUrl &&
          other.content == this.content &&
          other.pagePath == this.pagePath &&
          other.date == this.date);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int?> id;
  final Value<String> itemId;
  final Value<String> title;
  final Value<String?> imageUrl;
  final Value<String?> videoUrl;
  final Value<String?> content;
  final Value<String?> pagePath;
  final Value<DateTime?> date;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.title = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.content = const Value.absent(),
    this.pagePath = const Value.absent(),
    this.date = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required String itemId,
    required String title,
    this.imageUrl = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.content = const Value.absent(),
    this.pagePath = const Value.absent(),
    this.date = const Value.absent(),
  })  : itemId = Value(itemId),
        title = Value(title);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<String>? itemId,
    Expression<String>? title,
    Expression<String>? imageUrl,
    Expression<String>? videoUrl,
    Expression<String>? content,
    Expression<String>? pagePath,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (title != null) 'title': title,
      if (imageUrl != null) 'image_url': imageUrl,
      if (videoUrl != null) 'video_url': videoUrl,
      if (content != null) 'content': content,
      if (pagePath != null) 'page_path': pagePath,
      if (date != null) 'date': date,
    });
  }

  FavoritesCompanion copyWith(
      {Value<int?>? id,
      Value<String>? itemId,
      Value<String>? title,
      Value<String?>? imageUrl,
      Value<String?>? videoUrl,
      Value<String?>? content,
      Value<String?>? pagePath,
      Value<DateTime?>? date}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      content: content ?? this.content,
      pagePath: pagePath ?? this.pagePath,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (pagePath.present) {
      map['page_path'] = Variable<String>(pagePath.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('content: $content, ')
          ..write('pagePath: $pagePath, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseImpl extends GeneratedDatabase {
  _$DatabaseImpl(QueryExecutor e) : super(e);
  _$DatabaseImplManager get managers => _$DatabaseImplManager(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favorites];
}

typedef $$FavoritesTableInsertCompanionBuilder = FavoritesCompanion Function({
  Value<int?> id,
  required String itemId,
  required String title,
  Value<String?> imageUrl,
  Value<String?> videoUrl,
  Value<String?> content,
  Value<String?> pagePath,
  Value<DateTime?> date,
});
typedef $$FavoritesTableUpdateCompanionBuilder = FavoritesCompanion Function({
  Value<int?> id,
  Value<String> itemId,
  Value<String> title,
  Value<String?> imageUrl,
  Value<String?> videoUrl,
  Value<String?> content,
  Value<String?> pagePath,
  Value<DateTime?> date,
});

class $$FavoritesTableTableManager extends RootTableManager<
    _$DatabaseImpl,
    $FavoritesTable,
    Favorite,
    $$FavoritesTableFilterComposer,
    $$FavoritesTableOrderingComposer,
    $$FavoritesTableProcessedTableManager,
    $$FavoritesTableInsertCompanionBuilder,
    $$FavoritesTableUpdateCompanionBuilder> {
  $$FavoritesTableTableManager(_$DatabaseImpl db, $FavoritesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FavoritesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FavoritesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$FavoritesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> videoUrl = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<String?> pagePath = const Value.absent(),
            Value<DateTime?> date = const Value.absent(),
          }) =>
              FavoritesCompanion(
            id: id,
            itemId: itemId,
            title: title,
            imageUrl: imageUrl,
            videoUrl: videoUrl,
            content: content,
            pagePath: pagePath,
            date: date,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            required String itemId,
            required String title,
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> videoUrl = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<String?> pagePath = const Value.absent(),
            Value<DateTime?> date = const Value.absent(),
          }) =>
              FavoritesCompanion.insert(
            id: id,
            itemId: itemId,
            title: title,
            imageUrl: imageUrl,
            videoUrl: videoUrl,
            content: content,
            pagePath: pagePath,
            date: date,
          ),
        ));
}

class $$FavoritesTableProcessedTableManager extends ProcessedTableManager<
    _$DatabaseImpl,
    $FavoritesTable,
    Favorite,
    $$FavoritesTableFilterComposer,
    $$FavoritesTableOrderingComposer,
    $$FavoritesTableProcessedTableManager,
    $$FavoritesTableInsertCompanionBuilder,
    $$FavoritesTableUpdateCompanionBuilder> {
  $$FavoritesTableProcessedTableManager(super.$state);
}

class $$FavoritesTableFilterComposer
    extends FilterComposer<_$DatabaseImpl, $FavoritesTable> {
  $$FavoritesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get videoUrl => $state.composableBuilder(
      column: $state.table.videoUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get pagePath => $state.composableBuilder(
      column: $state.table.pagePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FavoritesTableOrderingComposer
    extends OrderingComposer<_$DatabaseImpl, $FavoritesTable> {
  $$FavoritesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get videoUrl => $state.composableBuilder(
      column: $state.table.videoUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pagePath => $state.composableBuilder(
      column: $state.table.pagePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$DatabaseImplManager {
  final _$DatabaseImpl _db;
  _$DatabaseImplManager(this._db);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
}
