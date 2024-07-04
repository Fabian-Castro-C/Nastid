import 'package:flutter/material.dart';

class Image2 extends StatelessWidget {
  final double mValue;
  final ValueChanged<double> onMValueChanged;

  const Image2({
    required this.mValue,
    required this.onMValueChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: mValue,
          min: 0,
          max: 10,
          divisions: 10,
          label: 'm = $mValue',
          onChanged: onMValueChanged,
        ),
        const Text('Imagen 2'),
        // Aquí irá la lógica para mostrar la Imagen 2
      ],
    );
  }
}