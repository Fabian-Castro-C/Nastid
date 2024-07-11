import 'package:flutter/material.dart';
import './body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nastid'),
      ),
      body: const HomeBody(),
    );
  }
}