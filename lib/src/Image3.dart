import 'package:flutter/material.dart';

class Image3 extends StatelessWidget {
  final double thresholdValue;
  final ValueChanged<double> onThresholdValueChanged;

  const Image3({
    required this.thresholdValue,
    required this.onThresholdValueChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: thresholdValue,
          min: 0,
          max: 10,
          divisions: 10,
          label: 'Threshold = $thresholdValue',
          onChanged: onThresholdValueChanged,
        ),
        Text('Imagen 3'),
        // Aquí irá la lógica para mostrar la Imagen 3
      ],
    );
  }
}