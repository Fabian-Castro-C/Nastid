import 'package:flutter/material.dart';

class IdentifierScreen extends StatefulWidget {
  final String pathImagesFolder; // Añade una variable final para almacenar el path
  const IdentifierScreen({super.key, required this.pathImagesFolder});

  @override
  State<IdentifierScreen> createState() => _IdentifierScreenState();
}

class _IdentifierScreenState extends State<IdentifierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificador de Imágenes'),
      ),
      body: Center(
        child: Text('Path: ${widget.pathImagesFolder}'), // Muestra el path en pantalla
      ),
    );
  }
}