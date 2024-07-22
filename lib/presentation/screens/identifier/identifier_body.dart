import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nastid/presentation/screens/identifier/file_selector_list.dart';
import './matrix_to_image.dart';

class IdentifierBody extends StatelessWidget {
  const IdentifierBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 20),
          MatrixImageWidget(),
          SizedBox(width: 20),
          MatrixImageWidget(),
          SizedBox(width: 20),
          MatrixImageWidget(),
          SizedBox(width: 20),
          FileSelectorList(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}