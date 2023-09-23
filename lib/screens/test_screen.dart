import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/global_controller.dart';

class TestScreen extends StatelessWidget {
  static String routeName = '/test';
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GetBuilder<GlobalController>(
            builder: (_) {
              var room = GlobalController.to.roomRawData;
              return Text(
                'Room: $room',
                style: TextStyle(fontSize: 20, color: Colors.black),
              );
            },
          ),
        ),
      ),
    );
  }
}
