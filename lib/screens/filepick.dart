import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilePickerScreenState createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  File? _pickedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _pickedFile = File(result.files.single.path!);
      });

      _showConfirmDialog();
    }
  }

  Future<void> _showConfirmDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Are you sure you want to pick this file?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _pickedFile = null;
                });
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.pop(context);
                print('Picked file: $_pickedFile');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_pickedFile == null)
              ElevatedButton(
                onPressed: _pickFile,
                child: const Text('Pick a File'),
              )
            else
              Text('Picked file: ${_pickedFile!.path}'),
          ],
        ),
      ),
    );
  }
}
