import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ImportFolderButton extends StatelessWidget {
  const ImportFolderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await FilePicker.platform.getDirectoryPath();
        print(result);
      },
      child: const Text('Abrir Carpeta'),
    );
  }
}