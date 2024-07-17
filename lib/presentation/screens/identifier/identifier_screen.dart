import 'package:flutter/material.dart';
import 'package:nastid/presentation/screens/identifier/change_folder_button.dart';
import 'package:nastid/presentation/screens/identifier/identifier_body.dart';

class IdentifierScreen extends StatelessWidget {
  const IdentifierScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            ChangeFolderButton(), // Botón para cambiar la carpeta
            SizedBox(width: 10),
            Center(child: Text('Identificador')), // Título de la pantalla
          ],
        ),
      ),
      body: const IdentifierBody(), // Muestra el path en pantalla
    );
  }
}