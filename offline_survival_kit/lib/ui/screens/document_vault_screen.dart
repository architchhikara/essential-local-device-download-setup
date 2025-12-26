import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/repositories/document_repository.dart';
import '../../data/database/app_database.dart';

class DocumentVaultScreen extends StatefulWidget {
  const DocumentVaultScreen({super.key});

  @override
  State<DocumentVaultScreen> createState() => _DocumentVaultScreenState();
}

class _DocumentVaultScreenState extends State<DocumentVaultScreen> {
  final _urlController = TextEditingController();
  final _titleController = TextEditingController();
  bool _isDownloading = false;

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<DocumentRepository>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Document Vault')),
      body: Column(
        children: [
          ExpansionTile(
            title: const Text('Add New Document'),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(labelText: 'URL (PDF/Web)'),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _isDownloading
                          ? null
                          : () async {
                              setState(() => _isDownloading = true);
                              try {
                                await repo.downloadDocument(
                                  _urlController.text,
                                  _titleController.text,
                                );
                                _urlController.clear();
                                _titleController.clear();
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Saved!')),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error: $e')),
                                  );
                                }
                              } finally {
                                setState(() => _isDownloading = false);
                              }
                            },
                      child: _isDownloading
                          ? const CircularProgressIndicator()
                          : const Text('Save to Vault'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<List<DocumentItem>>(
              stream: repo.getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                if (snapshot.data!.isEmpty) return const Center(child: Text('No documents.'));

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data![index];
                    return ListTile(
                      leading: Icon(doc.type == 'pdf' ? Icons.picture_as_pdf : Icons.article),
                      title: Text(doc.title),
                      subtitle: Text(doc.type),
                      onTap: () async {
                        // Open file
                        // Using url_launcher to open file URI? or specialized viewer.
                        // For simplicity, we just show the path.
                        // In real app, OpenFile.open(doc.localPath).
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('File at: ${doc.localPath}')),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
