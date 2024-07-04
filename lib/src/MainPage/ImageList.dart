import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Lista de imágenes'),
        // Aquí irá la lógica para mostrar la lista de imágenes
      ],
    );
  }
}