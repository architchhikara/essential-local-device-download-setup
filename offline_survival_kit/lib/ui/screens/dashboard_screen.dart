import 'package:flutter/material.dart';
import 'video_download_screen.dart';
import 'offline_map_screen.dart';
import 'document_vault_screen.dart';
import 'emergency_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offline Survival Kit')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          _DashboardItem(
            icon: Icons.video_library,
            label: 'Videos',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const VideoDownloadScreen()),
            ),
          ),
          _DashboardItem(
            icon: Icons.map,
            label: 'Offline Maps',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OfflineMapScreen()),
            ),
          ),
          _DashboardItem(
            icon: Icons.folder,
            label: 'Document Vault',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DocumentVaultScreen()),
            ),
          ),
          _DashboardItem(
            icon: Icons.medical_services,
            label: 'Emergency',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EmergencyScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DashboardItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8.0),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
