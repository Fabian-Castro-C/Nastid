import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:go_router/go_router.dart';
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
            context.read<PathImagesFolderCubit>().setPathFolder(pathImagesFolder);
          }
        } catch (e) {
          // Manejar el error aquí. Por ejemplo, mostrando un snackbar con el mensaje de error.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ocurrió un error al seleccionar la carpeta: $e'),
            ),
          );
        }
      },
      child: const Text('Cambiar Carpeta'),
    );
  }
}