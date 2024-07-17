import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nastid/presentation/blocs/blocs.dart';

class ImportFolderButton extends StatelessWidget {
  const ImportFolderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          final imageFolderPath = await getDirectoryPath();
          if (imageFolderPath != null) {
            if (context.mounted) {
              context.read<FileSelectionCubit>().setFolderPath(imageFolderPath);
              GoRouter.of(context).go('/identifier');
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
      child: const Text('Abrir Carpeta'),
    );
  }
}