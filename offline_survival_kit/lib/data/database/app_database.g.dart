// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $VideosTable extends Videos with TableInfo<$VideosTable, VideoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VideosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _youtubeUrlMeta =
      const VerificationMeta('youtubeUrl');
  @override
  late final GeneratedColumn<String> youtubeUrl = GeneratedColumn<String>(
      'youtube_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localPathMeta =
      const VerificationMeta('localPath');
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
      'local_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _resolutionMeta =
      const VerificationMeta('resolution');
  @override
  late final GeneratedColumn<String> resolution = GeneratedColumn<String>(
      'resolution', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, youtubeUrl, title, localPath, duration, resolution, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'videos';
  @override
  VerificationContext validateIntegrity(Insertable<VideoItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('youtube_url')) {
      context.handle(
          _youtubeUrlMeta,
          youtubeUrl.isAcceptableOrUnknown(
              data['youtube_url']!, _youtubeUrlMeta));
    } else if (isInserting) {
      context.missing(_youtubeUrlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta));
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('resolution')) {
      context.handle(
          _resolutionMeta,
          resolution.isAcceptableOrUnknown(
              data['resolution']!, _resolutionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VideoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VideoItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      youtubeUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}youtube_url'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      localPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_path'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      resolution: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resolution']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $VideosTable createAlias(String alias) {
    return $VideosTable(attachedDatabase, alias);
  }
}

class VideoItem extends DataClass implements Insertable<VideoItem> {
  final int id;
  final String youtubeUrl;
  final String title;
  final String localPath;
  final int? duration;
  final String? resolution;
  final DateTime createdAt;
  const VideoItem(
      {required this.id,
      required this.youtubeUrl,
      required this.title,
      required this.localPath,
      this.duration,
      this.resolution,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['youtube_url'] = Variable<String>(youtubeUrl);
    map['title'] = Variable<String>(title);
    map['local_path'] = Variable<String>(localPath);
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || resolution != null) {
      map['resolution'] = Variable<String>(resolution);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  VideosCompanion toCompanion(bool nullToAbsent) {
    return VideosCompanion(
      id: Value(id),
      youtubeUrl: Value(youtubeUrl),
      title: Value(title),
      localPath: Value(localPath),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      resolution: resolution == null && nullToAbsent
          ? const Value.absent()
          : Value(resolution),
      createdAt: Value(createdAt),
    );
  }

  factory VideoItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VideoItem(
      id: serializer.fromJson<int>(json['id']),
      youtubeUrl: serializer.fromJson<String>(json['youtubeUrl']),
      title: serializer.fromJson<String>(json['title']),
      localPath: serializer.fromJson<String>(json['localPath']),
      duration: serializer.fromJson<int?>(json['duration']),
      resolution: serializer.fromJson<String?>(json['resolution']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'youtubeUrl': serializer.toJson<String>(youtubeUrl),
      'title': serializer.toJson<String>(title),
      'localPath': serializer.toJson<String>(localPath),
      'duration': serializer.toJson<int?>(duration),
      'resolution': serializer.toJson<String?>(resolution),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  VideoItem copyWith(
          {int? id,
          String? youtubeUrl,
          String? title,
          String? localPath,
          Value<int?> duration = const Value.absent(),
          Value<String?> resolution = const Value.absent(),
          DateTime? createdAt}) =>
      VideoItem(
        id: id ?? this.id,
        youtubeUrl: youtubeUrl ?? this.youtubeUrl,
        title: title ?? this.title,
        localPath: localPath ?? this.localPath,
        duration: duration.present ? duration.value : this.duration,
        resolution: resolution.present ? resolution.value : this.resolution,
        createdAt: createdAt ?? this.createdAt,
      );
  VideoItem copyWithCompanion(VideosCompanion data) {
    return VideoItem(
      id: data.id.present ? data.id.value : this.id,
      youtubeUrl:
          data.youtubeUrl.present ? data.youtubeUrl.value : this.youtubeUrl,
      title: data.title.present ? data.title.value : this.title,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      duration: data.duration.present ? data.duration.value : this.duration,
      resolution:
          data.resolution.present ? data.resolution.value : this.resolution,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VideoItem(')
          ..write('id: $id, ')
          ..write('youtubeUrl: $youtubeUrl, ')
          ..write('title: $title, ')
          ..write('localPath: $localPath, ')
          ..write('duration: $duration, ')
          ..write('resolution: $resolution, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, youtubeUrl, title, localPath, duration, resolution, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VideoItem &&
          other.id == this.id &&
          other.youtubeUrl == this.youtubeUrl &&
          other.title == this.title &&
          other.localPath == this.localPath &&
          other.duration == this.duration &&
          other.resolution == this.resolution &&
          other.createdAt == this.createdAt);
}

class VideosCompanion extends UpdateCompanion<VideoItem> {
  final Value<int> id;
  final Value<String> youtubeUrl;
  final Value<String> title;
  final Value<String> localPath;
  final Value<int?> duration;
  final Value<String?> resolution;
  final Value<DateTime> createdAt;
  const VideosCompanion({
    this.id = const Value.absent(),
    this.youtubeUrl = const Value.absent(),
    this.title = const Value.absent(),
    this.localPath = const Value.absent(),
    this.duration = const Value.absent(),
    this.resolution = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  VideosCompanion.insert({
    this.id = const Value.absent(),
    required String youtubeUrl,
    required String title,
    required String localPath,
    this.duration = const Value.absent(),
    this.resolution = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : youtubeUrl = Value(youtubeUrl),
        title = Value(title),
        localPath = Value(localPath);
  static Insertable<VideoItem> custom({
    Expression<int>? id,
    Expression<String>? youtubeUrl,
    Expression<String>? title,
    Expression<String>? localPath,
    Expression<int>? duration,
    Expression<String>? resolution,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (youtubeUrl != null) 'youtube_url': youtubeUrl,
      if (title != null) 'title': title,
      if (localPath != null) 'local_path': localPath,
      if (duration != null) 'duration': duration,
      if (resolution != null) 'resolution': resolution,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  VideosCompanion copyWith(
      {Value<int>? id,
      Value<String>? youtubeUrl,
      Value<String>? title,
      Value<String>? localPath,
      Value<int?>? duration,
      Value<String?>? resolution,
      Value<DateTime>? createdAt}) {
    return VideosCompanion(
      id: id ?? this.id,
      youtubeUrl: youtubeUrl ?? this.youtubeUrl,
      title: title ?? this.title,
      localPath: localPath ?? this.localPath,
      duration: duration ?? this.duration,
      resolution: resolution ?? this.resolution,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (youtubeUrl.present) {
      map['youtube_url'] = Variable<String>(youtubeUrl.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (resolution.present) {
      map['resolution'] = Variable<String>(resolution.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VideosCompanion(')
          ..write('id: $id, ')
          ..write('youtubeUrl: $youtubeUrl, ')
          ..write('title: $title, ')
          ..write('localPath: $localPath, ')
          ..write('duration: $duration, ')
          ..write('resolution: $resolution, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MapTilesTable extends MapTiles
    with TableInfo<$MapTilesTable, MapTileItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MapTilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<int> x = GeneratedColumn<int>(
      'x', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<int> y = GeneratedColumn<int>(
      'y', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _zMeta = const VerificationMeta('z');
  @override
  late final GeneratedColumn<int> z = GeneratedColumn<int>(
      'z', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _localPathMeta =
      const VerificationMeta('localPath');
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
      'local_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, x, y, z, localPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'map_tiles';
  @override
  VerificationContext validateIntegrity(Insertable<MapTileItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('z')) {
      context.handle(_zMeta, z.isAcceptableOrUnknown(data['z']!, _zMeta));
    } else if (isInserting) {
      context.missing(_zMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta));
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MapTileItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MapTileItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      x: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x'])!,
      y: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}y'])!,
      z: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}z'])!,
      localPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_path'])!,
    );
  }

  @override
  $MapTilesTable createAlias(String alias) {
    return $MapTilesTable(attachedDatabase, alias);
  }
}

class MapTileItem extends DataClass implements Insertable<MapTileItem> {
  final int id;
  final int x;
  final int y;
  final int z;
  final String localPath;
  const MapTileItem(
      {required this.id,
      required this.x,
      required this.y,
      required this.z,
      required this.localPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['x'] = Variable<int>(x);
    map['y'] = Variable<int>(y);
    map['z'] = Variable<int>(z);
    map['local_path'] = Variable<String>(localPath);
    return map;
  }

  MapTilesCompanion toCompanion(bool nullToAbsent) {
    return MapTilesCompanion(
      id: Value(id),
      x: Value(x),
      y: Value(y),
      z: Value(z),
      localPath: Value(localPath),
    );
  }

  factory MapTileItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MapTileItem(
      id: serializer.fromJson<int>(json['id']),
      x: serializer.fromJson<int>(json['x']),
      y: serializer.fromJson<int>(json['y']),
      z: serializer.fromJson<int>(json['z']),
      localPath: serializer.fromJson<String>(json['localPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'x': serializer.toJson<int>(x),
      'y': serializer.toJson<int>(y),
      'z': serializer.toJson<int>(z),
      'localPath': serializer.toJson<String>(localPath),
    };
  }

  MapTileItem copyWith({int? id, int? x, int? y, int? z, String? localPath}) =>
      MapTileItem(
        id: id ?? this.id,
        x: x ?? this.x,
        y: y ?? this.y,
        z: z ?? this.z,
        localPath: localPath ?? this.localPath,
      );
  MapTileItem copyWithCompanion(MapTilesCompanion data) {
    return MapTileItem(
      id: data.id.present ? data.id.value : this.id,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
      z: data.z.present ? data.z.value : this.z,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MapTileItem(')
          ..write('id: $id, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('z: $z, ')
          ..write('localPath: $localPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, x, y, z, localPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MapTileItem &&
          other.id == this.id &&
          other.x == this.x &&
          other.y == this.y &&
          other.z == this.z &&
          other.localPath == this.localPath);
}

class MapTilesCompanion extends UpdateCompanion<MapTileItem> {
  final Value<int> id;
  final Value<int> x;
  final Value<int> y;
  final Value<int> z;
  final Value<String> localPath;
  const MapTilesCompanion({
    this.id = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.z = const Value.absent(),
    this.localPath = const Value.absent(),
  });
  MapTilesCompanion.insert({
    this.id = const Value.absent(),
    required int x,
    required int y,
    required int z,
    required String localPath,
  })  : x = Value(x),
        y = Value(y),
        z = Value(z),
        localPath = Value(localPath);
  static Insertable<MapTileItem> custom({
    Expression<int>? id,
    Expression<int>? x,
    Expression<int>? y,
    Expression<int>? z,
    Expression<String>? localPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (z != null) 'z': z,
      if (localPath != null) 'local_path': localPath,
    });
  }

  MapTilesCompanion copyWith(
      {Value<int>? id,
      Value<int>? x,
      Value<int>? y,
      Value<int>? z,
      Value<String>? localPath}) {
    return MapTilesCompanion(
      id: id ?? this.id,
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
      localPath: localPath ?? this.localPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (x.present) {
      map['x'] = Variable<int>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<int>(y.value);
    }
    if (z.present) {
      map['z'] = Variable<int>(z.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MapTilesCompanion(')
          ..write('id: $id, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('z: $z, ')
          ..write('localPath: $localPath')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, DocumentItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localPathMeta =
      const VerificationMeta('localPath');
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
      'local_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceUrlMeta =
      const VerificationMeta('sourceUrl');
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
      'source_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, type, localPath, sourceUrl, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(Insertable<DocumentItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta));
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('source_url')) {
      context.handle(_sourceUrlMeta,
          sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      localPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_path'])!,
      sourceUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_url']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class DocumentItem extends DataClass implements Insertable<DocumentItem> {
  final int id;
  final String title;
  final String type;
  final String localPath;
  final String? sourceUrl;
  final DateTime createdAt;
  const DocumentItem(
      {required this.id,
      required this.title,
      required this.type,
      required this.localPath,
      this.sourceUrl,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    map['local_path'] = Variable<String>(localPath);
    if (!nullToAbsent || sourceUrl != null) {
      map['source_url'] = Variable<String>(sourceUrl);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
      localPath: Value(localPath),
      sourceUrl: sourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrl),
      createdAt: Value(createdAt),
    );
  }

  factory DocumentItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      localPath: serializer.fromJson<String>(json['localPath']),
      sourceUrl: serializer.fromJson<String?>(json['sourceUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'localPath': serializer.toJson<String>(localPath),
      'sourceUrl': serializer.toJson<String?>(sourceUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DocumentItem copyWith(
          {int? id,
          String? title,
          String? type,
          String? localPath,
          Value<String?> sourceUrl = const Value.absent(),
          DateTime? createdAt}) =>
      DocumentItem(
        id: id ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
        localPath: localPath ?? this.localPath,
        sourceUrl: sourceUrl.present ? sourceUrl.value : this.sourceUrl,
        createdAt: createdAt ?? this.createdAt,
      );
  DocumentItem copyWithCompanion(DocumentsCompanion data) {
    return DocumentItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('localPath: $localPath, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, type, localPath, sourceUrl, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.localPath == this.localPath &&
          other.sourceUrl == this.sourceUrl &&
          other.createdAt == this.createdAt);
}

class DocumentsCompanion extends UpdateCompanion<DocumentItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> type;
  final Value<String> localPath;
  final Value<String?> sourceUrl;
  final Value<DateTime> createdAt;
  const DocumentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.localPath = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String type,
    required String localPath,
    this.sourceUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        type = Value(type),
        localPath = Value(localPath);
  static Insertable<DocumentItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? type,
    Expression<String>? localPath,
    Expression<String>? sourceUrl,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (localPath != null) 'local_path': localPath,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DocumentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? type,
      Value<String>? localPath,
      Value<String?>? sourceUrl,
      Value<DateTime>? createdAt}) {
    return DocumentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      localPath: localPath ?? this.localPath,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('localPath: $localPath, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $EmergencyItemsTable extends EmergencyItems
    with TableInfo<$EmergencyItemsTable, EmergencyItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmergencyItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, type, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'emergency_items';
  @override
  VerificationContext validateIntegrity(Insertable<EmergencyItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmergencyItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmergencyItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $EmergencyItemsTable createAlias(String alias) {
    return $EmergencyItemsTable(attachedDatabase, alias);
  }
}

class EmergencyItem extends DataClass implements Insertable<EmergencyItem> {
  final int id;
  final String title;
  final String content;
  final String type;
  final DateTime createdAt;
  const EmergencyItem(
      {required this.id,
      required this.title,
      required this.content,
      required this.type,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['type'] = Variable<String>(type);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EmergencyItemsCompanion toCompanion(bool nullToAbsent) {
    return EmergencyItemsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      type: Value(type),
      createdAt: Value(createdAt),
    );
  }

  factory EmergencyItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmergencyItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'type': serializer.toJson<String>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  EmergencyItem copyWith(
          {int? id,
          String? title,
          String? content,
          String? type,
          DateTime? createdAt}) =>
      EmergencyItem(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
      );
  EmergencyItem copyWithCompanion(EmergencyItemsCompanion data) {
    return EmergencyItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, type, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmergencyItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.type == this.type &&
          other.createdAt == this.createdAt);
}

class EmergencyItemsCompanion extends UpdateCompanion<EmergencyItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String> type;
  final Value<DateTime> createdAt;
  const EmergencyItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  EmergencyItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    required String type,
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        content = Value(content),
        type = Value(type);
  static Insertable<EmergencyItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? type,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  EmergencyItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String>? type,
      Value<DateTime>? createdAt}) {
    return EmergencyItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VideosTable videos = $VideosTable(this);
  late final $MapTilesTable mapTiles = $MapTilesTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $EmergencyItemsTable emergencyItems = $EmergencyItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [videos, mapTiles, documents, emergencyItems];
}

typedef $$VideosTableCreateCompanionBuilder = VideosCompanion Function({
  Value<int> id,
  required String youtubeUrl,
  required String title,
  required String localPath,
  Value<int?> duration,
  Value<String?> resolution,
  Value<DateTime> createdAt,
});
typedef $$VideosTableUpdateCompanionBuilder = VideosCompanion Function({
  Value<int> id,
  Value<String> youtubeUrl,
  Value<String> title,
  Value<String> localPath,
  Value<int?> duration,
  Value<String?> resolution,
  Value<DateTime> createdAt,
});

class $$VideosTableFilterComposer
    extends Composer<_$AppDatabase, $VideosTable> {
  $$VideosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get youtubeUrl => $composableBuilder(
      column: $table.youtubeUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resolution => $composableBuilder(
      column: $table.resolution, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$VideosTableOrderingComposer
    extends Composer<_$AppDatabase, $VideosTable> {
  $$VideosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get youtubeUrl => $composableBuilder(
      column: $table.youtubeUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resolution => $composableBuilder(
      column: $table.resolution, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$VideosTableAnnotationComposer
    extends Composer<_$AppDatabase, $VideosTable> {
  $$VideosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get youtubeUrl => $composableBuilder(
      column: $table.youtubeUrl, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get resolution => $composableBuilder(
      column: $table.resolution, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$VideosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VideosTable,
    VideoItem,
    $$VideosTableFilterComposer,
    $$VideosTableOrderingComposer,
    $$VideosTableAnnotationComposer,
    $$VideosTableCreateCompanionBuilder,
    $$VideosTableUpdateCompanionBuilder,
    (VideoItem, BaseReferences<_$AppDatabase, $VideosTable, VideoItem>),
    VideoItem,
    PrefetchHooks Function()> {
  $$VideosTableTableManager(_$AppDatabase db, $VideosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VideosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VideosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VideosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> youtubeUrl = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> localPath = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> resolution = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              VideosCompanion(
            id: id,
            youtubeUrl: youtubeUrl,
            title: title,
            localPath: localPath,
            duration: duration,
            resolution: resolution,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String youtubeUrl,
            required String title,
            required String localPath,
            Value<int?> duration = const Value.absent(),
            Value<String?> resolution = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              VideosCompanion.insert(
            id: id,
            youtubeUrl: youtubeUrl,
            title: title,
            localPath: localPath,
            duration: duration,
            resolution: resolution,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VideosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VideosTable,
    VideoItem,
    $$VideosTableFilterComposer,
    $$VideosTableOrderingComposer,
    $$VideosTableAnnotationComposer,
    $$VideosTableCreateCompanionBuilder,
    $$VideosTableUpdateCompanionBuilder,
    (VideoItem, BaseReferences<_$AppDatabase, $VideosTable, VideoItem>),
    VideoItem,
    PrefetchHooks Function()>;
typedef $$MapTilesTableCreateCompanionBuilder = MapTilesCompanion Function({
  Value<int> id,
  required int x,
  required int y,
  required int z,
  required String localPath,
});
typedef $$MapTilesTableUpdateCompanionBuilder = MapTilesCompanion Function({
  Value<int> id,
  Value<int> x,
  Value<int> y,
  Value<int> z,
  Value<String> localPath,
});

class $$MapTilesTableFilterComposer
    extends Composer<_$AppDatabase, $MapTilesTable> {
  $$MapTilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get z => $composableBuilder(
      column: $table.z, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnFilters(column));
}

class $$MapTilesTableOrderingComposer
    extends Composer<_$AppDatabase, $MapTilesTable> {
  $$MapTilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get z => $composableBuilder(
      column: $table.z, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnOrderings(column));
}

class $$MapTilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MapTilesTable> {
  $$MapTilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<int> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

  GeneratedColumn<int> get z =>
      $composableBuilder(column: $table.z, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);
}

class $$MapTilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MapTilesTable,
    MapTileItem,
    $$MapTilesTableFilterComposer,
    $$MapTilesTableOrderingComposer,
    $$MapTilesTableAnnotationComposer,
    $$MapTilesTableCreateCompanionBuilder,
    $$MapTilesTableUpdateCompanionBuilder,
    (MapTileItem, BaseReferences<_$AppDatabase, $MapTilesTable, MapTileItem>),
    MapTileItem,
    PrefetchHooks Function()> {
  $$MapTilesTableTableManager(_$AppDatabase db, $MapTilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MapTilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MapTilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MapTilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
            Value<int> z = const Value.absent(),
            Value<String> localPath = const Value.absent(),
          }) =>
              MapTilesCompanion(
            id: id,
            x: x,
            y: y,
            z: z,
            localPath: localPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int x,
            required int y,
            required int z,
            required String localPath,
          }) =>
              MapTilesCompanion.insert(
            id: id,
            x: x,
            y: y,
            z: z,
            localPath: localPath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MapTilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MapTilesTable,
    MapTileItem,
    $$MapTilesTableFilterComposer,
    $$MapTilesTableOrderingComposer,
    $$MapTilesTableAnnotationComposer,
    $$MapTilesTableCreateCompanionBuilder,
    $$MapTilesTableUpdateCompanionBuilder,
    (MapTileItem, BaseReferences<_$AppDatabase, $MapTilesTable, MapTileItem>),
    MapTileItem,
    PrefetchHooks Function()>;
typedef $$DocumentsTableCreateCompanionBuilder = DocumentsCompanion Function({
  Value<int> id,
  required String title,
  required String type,
  required String localPath,
  Value<String?> sourceUrl,
  Value<DateTime> createdAt,
});
typedef $$DocumentsTableUpdateCompanionBuilder = DocumentsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> type,
  Value<String> localPath,
  Value<String?> sourceUrl,
  Value<DateTime> createdAt,
});

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceUrl => $composableBuilder(
      column: $table.sourceUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
      column: $table.sourceUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DocumentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DocumentsTable,
    DocumentItem,
    $$DocumentsTableFilterComposer,
    $$DocumentsTableOrderingComposer,
    $$DocumentsTableAnnotationComposer,
    $$DocumentsTableCreateCompanionBuilder,
    $$DocumentsTableUpdateCompanionBuilder,
    (
      DocumentItem,
      BaseReferences<_$AppDatabase, $DocumentsTable, DocumentItem>
    ),
    DocumentItem,
    PrefetchHooks Function()> {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> localPath = const Value.absent(),
            Value<String?> sourceUrl = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              DocumentsCompanion(
            id: id,
            title: title,
            type: type,
            localPath: localPath,
            sourceUrl: sourceUrl,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String type,
            required String localPath,
            Value<String?> sourceUrl = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              DocumentsCompanion.insert(
            id: id,
            title: title,
            type: type,
            localPath: localPath,
            sourceUrl: sourceUrl,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DocumentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DocumentsTable,
    DocumentItem,
    $$DocumentsTableFilterComposer,
    $$DocumentsTableOrderingComposer,
    $$DocumentsTableAnnotationComposer,
    $$DocumentsTableCreateCompanionBuilder,
    $$DocumentsTableUpdateCompanionBuilder,
    (
      DocumentItem,
      BaseReferences<_$AppDatabase, $DocumentsTable, DocumentItem>
    ),
    DocumentItem,
    PrefetchHooks Function()>;
typedef $$EmergencyItemsTableCreateCompanionBuilder = EmergencyItemsCompanion
    Function({
  Value<int> id,
  required String title,
  required String content,
  required String type,
  Value<DateTime> createdAt,
});
typedef $$EmergencyItemsTableUpdateCompanionBuilder = EmergencyItemsCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
  Value<String> type,
  Value<DateTime> createdAt,
});

class $$EmergencyItemsTableFilterComposer
    extends Composer<_$AppDatabase, $EmergencyItemsTable> {
  $$EmergencyItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$EmergencyItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $EmergencyItemsTable> {
  $$EmergencyItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$EmergencyItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmergencyItemsTable> {
  $$EmergencyItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$EmergencyItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EmergencyItemsTable,
    EmergencyItem,
    $$EmergencyItemsTableFilterComposer,
    $$EmergencyItemsTableOrderingComposer,
    $$EmergencyItemsTableAnnotationComposer,
    $$EmergencyItemsTableCreateCompanionBuilder,
    $$EmergencyItemsTableUpdateCompanionBuilder,
    (
      EmergencyItem,
      BaseReferences<_$AppDatabase, $EmergencyItemsTable, EmergencyItem>
    ),
    EmergencyItem,
    PrefetchHooks Function()> {
  $$EmergencyItemsTableTableManager(
      _$AppDatabase db, $EmergencyItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmergencyItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmergencyItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmergencyItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              EmergencyItemsCompanion(
            id: id,
            title: title,
            content: content,
            type: type,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String content,
            required String type,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              EmergencyItemsCompanion.insert(
            id: id,
            title: title,
            content: content,
            type: type,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EmergencyItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EmergencyItemsTable,
    EmergencyItem,
    $$EmergencyItemsTableFilterComposer,
    $$EmergencyItemsTableOrderingComposer,
    $$EmergencyItemsTableAnnotationComposer,
    $$EmergencyItemsTableCreateCompanionBuilder,
    $$EmergencyItemsTableUpdateCompanionBuilder,
    (
      EmergencyItem,
      BaseReferences<_$AppDatabase, $EmergencyItemsTable, EmergencyItem>
    ),
    EmergencyItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VideosTableTableManager get videos =>
      $$VideosTableTableManager(_db, _db.videos);
  $$MapTilesTableTableManager get mapTiles =>
      $$MapTilesTableTableManager(_db, _db.mapTiles);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
  $$EmergencyItemsTableTableManager get emergencyItems =>
      $$EmergencyItemsTableTableManager(_db, _db.emergencyItems);
}
