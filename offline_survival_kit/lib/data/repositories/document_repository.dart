import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import '../database/app_database.dart';
import '../services/storage_service.dart';

class DocumentRepository {
  final StorageService _storageService;
  final AppDatabase _database;
  final Dio _dio;

  DocumentRepository(this._storageService, this._database) : _dio = Dio();

  Future<void> downloadDocument(String url, String title) async {
    final dir = await _storageService.getDocumentsDirectory();
    final ext = p.extension(url).isEmpty ? '.html' : p.extension(url);
    final filename = '${title.replaceAll(RegExp(r'[^\w\s]+'), '_')}$ext';
    final filePath = p.join(dir.path, filename);

    await _dio.download(url, filePath);

    await _database.into(_database.documents).insert(
      DocumentsCompanion.insert(
        title: title,
        type: ext.replaceAll('.', ''),
        localPath: filePath,
        sourceUrl: Value(url),
      ),
    );
  }

  Stream<List<DocumentItem>> getDocuments() {
    return _database.select(_database.documents).watch();
  }
}
