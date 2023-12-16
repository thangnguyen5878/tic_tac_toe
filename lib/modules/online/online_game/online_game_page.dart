import 'package:flutter/material.dart';

class OnlineGamePage extends StatelessWidget {
  const OnlineGamePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnlineGameView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnlineGameView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
