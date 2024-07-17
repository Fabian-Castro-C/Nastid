import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nastid/presentation/blocs/blocs.dart';

class ChangeFolderButton extends StatelessWidget {
  const ChangeFolderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        
      ),
      onPressed: () async {
        try {
          final pathImagesFolder = await getDirectoryPath();
          if (pathImagesFolder != null) {
            if (context.mounted) {
              context.read<FileSelectionCubit>().setFolderPath(pathImagesFolder);
            }
          }
        } catch (e) {
          // Manejar el error aquí. Por ejemplo, mostrando un snackbar con el mensaje de error.
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Ocurrió un error al seleccionar la carpeta: $e'),
              ),
            );
          }
        }
      },
      child: const Text('Cambiar Carpeta'),
    );
  }
}