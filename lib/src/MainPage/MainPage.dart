import 'package:flutter/material.dart';
import 'ImageList.dart';
import 'ImageSection.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double mValue = 0;
  double thresholdValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Nastid',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: ImageSection(
              mValue: mValue,
              thresholdValue: thresholdValue,
              onMValueChanged: (value) {
                setState(() {
                  mValue = value;
                });
              },
              onThresholdValueChanged: (value) {
                setState(() {
                  thresholdValue = value;
                });
              },
            ),
          ),
          const Expanded(
            flex: 1,
            child: ImageList(),
          ),
        ],
      ),
    );
  }
}