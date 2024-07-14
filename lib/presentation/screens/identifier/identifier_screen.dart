import 'package:flutter/material.dart';
import 'package:nastid/presentation/blocs/identifier/path_folder_images_cubit.dart';

class IdentifierScreen extends StatefulWidget {
  final String pathImagesFolder; // Añade una variable final para almacenar el path
  const IdentifierScreen({super.key, required this.pathImagesFolder});

  @override
  State<IdentifierScreen> createState() => _IdentifierScreenState();
}

class _IdentifierScreenState extends State<IdentifierScreen> {

  final pathFolderImagesCubit = PathImagesFolderCubit();

  @override
  Widget build(BuildContext context) {

    final pathImagesFolders = pathFolderImagesCubit.state; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificador de Imágenes'),
      ),
      body: Center(
        child: Text(pathImagesFolders), // Muestra el path en pantalla
      ),
    );
  }
}