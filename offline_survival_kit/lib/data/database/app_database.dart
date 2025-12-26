import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';

@DataClassName('VideoItem')
class Videos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get youtubeUrl => text()();
  TextColumn get title => text()();
  TextColumn get localPath => text()();
  IntColumn get duration => integer().nullable()(); // in seconds
  TextColumn get resolution => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('MapTileItem')
class MapTiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get x => integer()();
  IntColumn get y => integer()();
  IntColumn get z => integer()();
  TextColumn get localPath => text()();
}

@DataClassName('DocumentItem')
class Documents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get type => text()(); // pdf, html
  TextColumn get localPath => text()();
  TextColumn get sourceUrl => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('EmergencyItem')
class EmergencyItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get type => text()(); // note, contact
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Videos, MapTiles, Documents, EmergencyItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
