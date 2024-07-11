import 'package:flutter/material.dart';
import './import_folder_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center( // Envuelve la Column con un widget Center
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenido a Nastid',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          const ImportFolderButton(),
        ],
      ),
    );
  }
}