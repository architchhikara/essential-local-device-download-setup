import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/database/app_database.dart';
import 'data/services/storage_service.dart';
import 'data/repositories/video_repository.dart';
import 'data/repositories/map_repository.dart';
import 'data/repositories/document_repository.dart';
import 'data/repositories/emergency_repository.dart';
import 'ui/screens/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();
  final storage = StorageService();

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: db),
        Provider<StorageService>.value(value: storage),
        ProxyProvider2<StorageService, AppDatabase, VideoRepository>(
          update: (_, storage, db, __) => VideoRepository(storage, db),
        ),
        ProxyProvider2<StorageService, AppDatabase, MapRepository>(
          update: (_, storage, db, __) => MapRepository(storage, db),
        ),
        ProxyProvider2<StorageService, AppDatabase, DocumentRepository>(
          update: (_, storage, db, __) => DocumentRepository(storage, db),
        ),
        ProxyProvider<AppDatabase, EmergencyRepository>(
          update: (_, db, __) => EmergencyRepository(db),
        ),
      ],
      child: const OfflineSurvivalKitApp(),
    ),
  );
}

class OfflineSurvivalKitApp extends StatelessWidget {
  const OfflineSurvivalKitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline Survival Kit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
