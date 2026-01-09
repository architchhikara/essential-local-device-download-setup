import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'dart:io';
import 'dart:math';
import '../database/app_database.dart';
import '../services/storage_service.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';

class MapRepository {
  final StorageService _storageService;
  final AppDatabase _database;
  final Dio _dio;

  MapRepository(this._storageService, this._database) : _dio = Dio();

  // Simplified tile download logic for a region
  // In a real app, you'd calculate all X/Y tiles for a bounding box at specific zoom levels
  Future<void> downloadRegion(LatLng center, int zoom, Function(int, int) onProgress) async {
    // Demo: Download just the center tile and 8 neighbors at current zoom
    // This is a placeholder for a complex tile calculation logic

    int downloaded = 0;
    int total = 9; // 3x3 grid

    final n = pow(2, zoom);
    final x = ((center.longitude + 180.0) / 360.0 * n).floor();
    final y = ((1.0 - log(tan(center.latitude * pi / 180.0) + 1.0 / cos(center.latitude * pi / 180.0)) / pi) / 2.0 * n).floor();

    for (var dx = -1; dx <= 1; dx++) {
      for (var dy = -1; dy <= 1; dy++) {
        await _downloadTile(zoom, x + dx, y + dy);
        downloaded++;
        onProgress(downloaded, total);
      }
    }
  }

  Future<void> _downloadTile(int z, int x, int y) async {
    final url = 'https://tile.openstreetmap.org/$z/$x/$y.png';
    try {
      final dir = await _storageService.getMapsDirectory();
      final filename = '$z-$x-$y.png';
      final filePath = p.join(dir.path, filename);

      if (await File(filePath).exists()) return;

      await _dio.download(
        url,
        filePath,
        options: Options(headers: {'User-Agent': 'OfflineSurvivalKit/1.0'}),
      );

      await _database.into(_database.mapTiles).insert(
        MapTilesCompanion.insert(
          x: x,
          y: y,
          z: z,
          localPath: filePath,
        ),
        mode: InsertMode.insertOrIgnore,
      );
    } catch (e) {
      debugPrint('Failed to download tile $z/$x/$y: $e');
    }
  }

  Future<File?> getTileFile(int z, int x, int y) async {
    final query = await (_database.select(_database.mapTiles)
      ..where((t) => t.x.equals(x) & t.y.equals(y) & t.z.equals(z)))
      .getSingleOrNull();

    if (query != null) {
      return File(query.localPath);
    }
    return null;
  }

  Future<String> getMapsPath() async {
    final dir = await _storageService.getMapsDirectory();
    return dir.path;
  }
}
