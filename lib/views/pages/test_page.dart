import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body: Text(
      'Hello!!!',
      style: TextStyle(fontSize: 20, color: Colors.black),
    )));
  }
}
