import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import the library that defines 'read'
import 'package:nastid/presentation/blocs/identifier/path_folder_images_cubit.dart';

class IdentifierScreen extends StatefulWidget {
  const IdentifierScreen({super.key});

  @override
  State<IdentifierScreen> createState() => _IdentifierScreenState();
}

class _IdentifierScreenState extends State<IdentifierScreen> {

  @override
  Widget build(BuildContext context) {
    
    final pathImagesFolderCubit = context.watch<PathImagesFolderCubit>(); 
    final path = pathImagesFolderCubit.state; // Obtiene el estado del cubit

    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificador de Imágenes'),
      ),
      body: Center(
        child: Text(path), // Muestra el path en pantalla
      ),
    );
  }
}