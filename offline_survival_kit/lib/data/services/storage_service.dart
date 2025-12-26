import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class StorageService {
  static const String _videosDir = 'videos';
  static const String _mapsDir = 'maps';
  static const String _docsDir = 'documents';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<Directory> getVideosDirectory() async {
    final path = await _localPath;
    final dir = Directory(p.join(path, _videosDir));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<Directory> getMapsDirectory() async {
    final path = await _localPath;
    final dir = Directory(p.join(path, _mapsDir));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<Directory> getDocumentsDirectory() async {
    final path = await _localPath;
    final dir = Directory(p.join(path, _docsDir));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<String> getFilePath(String filename, String subDir) async {
    final path = await _localPath;
    return p.join(path, subDir, filename);
  }
}
