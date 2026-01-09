import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/repositories/emergency_repository.dart';
import '../../data/database/app_database.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Emergency Kit'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.note), text: 'Notes'),
              Tab(icon: Icon(Icons.contact_phone), text: 'Contacts'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _EmergencyList(type: 'note'),
            _EmergencyList(type: 'contact'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _showAddDialog(context),
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const _AddEmergencyItemDialog(),
    );
  }
}

class _EmergencyList extends StatelessWidget {
  final String type;

  const _EmergencyList({required this.type});

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<EmergencyRepository>(context);
    return StreamBuilder<List<EmergencyItem>>(
      stream: repo.getItems(type),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        if (snapshot.data!.isEmpty) return const Center(child: Text('Empty. Add something!'));

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final item = snapshot.data![index];
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.content),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => repo.deleteItem(item.id),
              ),
            );
          },
        );
      },
    );
  }
}

class _AddEmergencyItemDialog extends StatefulWidget {
  const _AddEmergencyItemDialog();

  @override
  State<_AddEmergencyItemDialog> createState() => _AddEmergencyItemDialogState();
}

class _AddEmergencyItemDialogState extends State<_AddEmergencyItemDialog> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _type = 'note';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _titleController, decoration: const InputDecoration(labelText: 'Title')),
          TextField(controller: _contentController, decoration: const InputDecoration(labelText: 'Content')),
          DropdownButton<String>(
            value: _type,
            items: const [
              DropdownMenuItem(value: 'note', child: Text('Note')),
              DropdownMenuItem(value: 'contact', child: Text('Contact')),
            ],
            onChanged: (val) => setState(() => _type = val!),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<EmergencyRepository>(context, listen: false)
                .addNote(_titleController.text, _contentController.text, _type);
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
