import 'package:flutter/material.dart';

void main() {
  runApp(const TestingApp());
}

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Testing App',
      home: Scaffold(
        body: Center(
          child: Text('Learning Flutter testing'),
        ),
      ),
    );
  }
}
