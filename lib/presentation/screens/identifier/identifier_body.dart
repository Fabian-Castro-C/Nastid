import 'package:flutter/material.dart';
import 'package:nastid/presentation/screens/identifier/file_selector_list.dart';

class IdentifierBody extends StatelessWidget {
  const IdentifierBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Image1'),
          SizedBox(width: 10), // Agrega espacio entre los elementos
          Text('Image2'),
          SizedBox(width: 10),
          Text('Image3'),
          SizedBox(width: 10),
          FileSelectorList(),
        ],
      ),
    );
  }
}