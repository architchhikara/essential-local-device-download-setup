import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../data/repositories/video_repository.dart';
import '../../data/database/app_database.dart';

class VideoDownloadScreen extends StatefulWidget {
  const VideoDownloadScreen({super.key});

  @override
  State<VideoDownloadScreen> createState() => _VideoDownloadScreenState();
}

class _VideoDownloadScreenState extends State<VideoDownloadScreen> {
  final TextEditingController _urlController = TextEditingController();
  List<StreamInfo>? _availableStreams;
  StreamInfo? _selectedStream;
  bool _isLoadingInfo = false;
  bool _isDownloading = false;
  double _progress = 0.0;
  String? _statusMessage;

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<VideoRepository>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Video Downloader')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _urlController,
                    decoration: const InputDecoration(
                      labelText: 'YouTube URL',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    setState(() {
                      _isLoadingInfo = true;
                      _statusMessage = 'Fetching video info...';
                      _availableStreams = null;
                      _selectedStream = null;
                    });
                    try {
                      var streams = await repo.getStreamManifest(_urlController.text);
                      setState(() {
                        _availableStreams = streams;
                        if (streams.isNotEmpty) {
                          _selectedStream = streams.first;
                        }
                        _statusMessage = 'Select quality and download.';
                      });
                    } catch (e) {
                      setState(() {
                        _statusMessage = 'Error: $e';
                      });
                    } finally {
                      setState(() {
                        _isLoadingInfo = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          if (_isLoadingInfo) const LinearProgressIndicator(),
          if (_statusMessage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_statusMessage!),
            ),
          if (_availableStreams != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DropdownButton<StreamInfo>(
                isExpanded: true,
                value: _selectedStream,
                items: _availableStreams!.map((s) {
                  return DropdownMenuItem(
                    value: s,
                    child: Text('${s.qualityLabel} (${s.container.name})'),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedStream = val;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: _isDownloading
                  ? null
                  : () async {
                      if (_selectedStream == null) return;
                      setState(() {
                        _isDownloading = true;
                        _progress = 0.0;
                        _statusMessage = 'Downloading...';
                      });
                      try {
                        await repo.downloadVideo(
                          _urlController.text,
                          _selectedStream!,
                          (received, total) {
                            if (total != -1) {
                              setState(() {
                                _progress = received / total;
                              });
                            }
                          },
                        );
                        setState(() {
                          _statusMessage = 'Download complete!';
                          _urlController.clear();
                          _availableStreams = null;
                        });
                      } catch (e) {
                        setState(() {
                          _statusMessage = 'Download failed: $e';
                        });
                      } finally {
                        setState(() {
                          _isDownloading = false;
                        });
                      }
                    },
              child: const Text('Download'),
            ),
            if (_isDownloading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(value: _progress),
              ),
          ],
          const Divider(),
          const Expanded(child: DownloadedVideosList()),
        ],
      ),
    );
  }
}

class DownloadedVideosList extends StatelessWidget {
  const DownloadedVideosList({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<VideoRepository>(context);
    return StreamBuilder<List<VideoItem>>(
      stream: repo.getDownloadedVideos(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        if (snapshot.data!.isEmpty) return const Center(child: Text('No downloads yet.'));

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final video = snapshot.data![index];
            return ListTile(
              title: Text(video.title),
              subtitle: Text('${video.resolution ?? "Unknown"} • ${video.duration ?? 0}s'),
              trailing: const Icon(Icons.play_circle_outline),
              onTap: () {
                // TODO: Play video
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Saved at: ${video.localPath}')),
                );
              },
            );
          },
        );
      },
    );
  }
}
