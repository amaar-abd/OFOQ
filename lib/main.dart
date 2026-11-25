import 'package:flutter/material.dart';

void main() {
  runApp(const OFOQ());
}

class OFOQ extends StatelessWidget {
  const OFOQ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OFOQ',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Text('OFOQ'),
    );
  }
}
