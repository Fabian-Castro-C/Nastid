import 'package:flutter/material.dart';
import './import_folder_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center( // Envuelve la Column con un widget Center
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Título',
          ),
          SizedBox(height: 16),
          ImportFolderButton(),
        ],
      ),
    );
  }
}