import 'package:flutter/material.dart';

class IdentifierScreen extends StatelessWidget {
  const IdentifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identifier Screen'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}