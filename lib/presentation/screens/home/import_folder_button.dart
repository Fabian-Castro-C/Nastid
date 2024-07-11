import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';

class ImportFolderButton extends StatelessWidget {
  const ImportFolderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await getDirectoryPath();
        print('Directorio seleccionado: $result');
      },
      child: const Text('Abrir Carpeta'),
    );
  }
}