import '../database/app_database.dart';

class EmergencyRepository {
  final AppDatabase _database;

  EmergencyRepository(this._database);

  Future<void> addNote(String title, String content, String type) async {
    await _database.into(_database.emergencyItems).insert(
      EmergencyItemsCompanion.insert(
        title: title,
        content: content,
        type: type,
      ),
    );
  }

  Future<void> deleteItem(int id) async {
    await (_database.delete(_database.emergencyItems)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<EmergencyItem>> getItems(String type) {
    return (_database.select(_database.emergencyItems)..where((t) => t.type.equals(type))).watch();
  }
}
