import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../data/repositories/map_repository.dart';

class OfflineMapScreen extends StatefulWidget {
  const OfflineMapScreen({super.key});

  @override
  State<OfflineMapScreen> createState() => _OfflineMapScreenState();
}

class _OfflineMapScreenState extends State<OfflineMapScreen> {
  final MapController _mapController = MapController();
  bool _isDownloading = false;
  double _progress = 0.0;
  String? _mapsPath;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       final repo = Provider.of<MapRepository>(context, listen: false);
       final path = await repo.getMapsPath();
       setState(() {
         _mapsPath = path;
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<MapRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Maps'),
        actions: [
          if (_isDownloading)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(value: _progress, strokeWidth: 2),
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.download),
              tooltip: 'Download Current View (Demo)',
              onPressed: () async {
                setState(() {
                  _isDownloading = true;
                  _progress = 0.0;
                });

                final center = _mapController.camera.center;
                final zoom = _mapController.camera.zoom.round();

                await repo.downloadRegion(center, zoom, (done, total) {
                  setState(() {
                    _progress = done / total;
                  });
                });

                setState(() {
                  _isDownloading = false;
                });

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Download Complete')),
                  );
                }
              },
            )
        ],
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: const MapOptions(
          initialCenter: LatLng(51.5, -0.09), // London
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.jules.offline_survival_kit',
            tileProvider: _mapsPath != null ? OfflineTileProvider(_mapsPath!) : null,
          ),
        ],
      ),
    );
  }
}

class OfflineTileProvider extends TileProvider {
  final String basePath;

  OfflineTileProvider(this.basePath);

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    final x = coordinates.x;
    final y = coordinates.y;
    final z = coordinates.z;

    // Construct local path
    final localPath = '$basePath/$z-$x-$y.png';
    final file = File(localPath);

    // Check existence synchronously
    if (file.existsSync()) {
      return FileImage(file);
    }

    return NetworkImage(
      getTileUrl(coordinates, options),
      headers: headers,
    );
  }
}
