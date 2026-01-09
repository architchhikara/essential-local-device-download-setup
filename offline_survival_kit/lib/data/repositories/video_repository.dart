import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../database/app_database.dart';
import '../services/storage_service.dart';
import 'package:path/path.dart' as p;

class VideoRepository {
  final StorageService _storageService;
  final AppDatabase _database;
  final YoutubeExplode _yt;
  final Dio _dio;

  VideoRepository(this._storageService, this._database)
      : _yt = YoutubeExplode(),
        _dio = Dio();

  Future<Video> getVideoInfo(String url) async {
    return await _yt.videos.get(url);
  }

  Future<List<StreamInfo>> getStreamManifest(String url) async {
    var manifest = await _yt.videos.streamsClient.getManifest(url);
    return manifest.muxed.toList();
  }

  Future<void> downloadVideo(
    String url,
    StreamInfo streamInfo,
    Function(int, int) onProgress,
  ) async {
    var video = await _yt.videos.get(url);
    var title = video.title.replaceAll(RegExp(r'[^\w\s\.]+'), '_'); // Sanitize filename
    var filename = '$title.${streamInfo.container.name}';

    var dir = await _storageService.getVideosDirectory();
    var filePath = p.join(dir.path, filename);

    await _dio.download(
      streamInfo.url.toString(),
      filePath,
      onReceiveProgress: onProgress,
    );

    // Save metadata
    await _database.into(_database.videos).insert(
          VideosCompanion.insert(
            youtubeUrl: url,
            title: video.title,
            localPath: filePath,
            duration: Value(video.duration?.inSeconds),
            resolution: Value(streamInfo.qualityLabel),
          ),
        );
  }

  Stream<List<VideoItem>> getDownloadedVideos() {
    return _database.select(_database.videos).watch();
  }

  void dispose() {
    _yt.close();
  }
}
