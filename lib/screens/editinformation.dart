import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Edit> {
  final List<String> _titles = [
    'Father Name',
    'Contact Number',
    'Email Address',
    'Permanent Address'
  ];
  final List<String> _subtitles = [
    'John Doe',
    'johndoe@example.com',
    '555-555-5555',
    '123 Main St, Anytown USA 12345'
  ];

  void _openEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Personal Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int i = 0; i < _titles.length; i++)
                TextField(
                  decoration: InputDecoration(labelText: _titles[i]),
                  onChanged: (text) => setState(() => _subtitles[i] = text),
                ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Personal Information"),
                  IconButton(
                      onPressed: _openEditDialog, icon: const Icon(Icons.edit))
                ],
              ),
              for (int i = 0; i < _titles.length; i++)
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(_titles[i]),
                  subtitle: Text(_subtitles[i]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
