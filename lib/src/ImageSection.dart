import 'package:flutter/material.dart';
import './Image1.dart';
import './Image2.dart';
import './Image3.dart';

class ImageSection extends StatelessWidget {
  final double mValue;
  final double thresholdValue;
  final ValueChanged<double> onMValueChanged;
  final ValueChanged<double> onThresholdValueChanged;

  const ImageSection({
    required this.mValue,
    required this.thresholdValue,
    required this.onMValueChanged,
    required this.onThresholdValueChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(child: Image1()),
              Expanded(
                child: Image2(
                  mValue: mValue,
                  onMValueChanged: onMValueChanged,
                ),
              ),
              Expanded(
                child: Image3(
                  thresholdValue: thresholdValue,
                  onThresholdValueChanged: onThresholdValueChanged,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}