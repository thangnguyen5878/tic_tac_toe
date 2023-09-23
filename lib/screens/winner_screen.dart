import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/global_controller.dart';

class WinnerScreen extends StatelessWidget {
  static String routeName = '/winner';
  const WinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(125, 0, 0, 0),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Round ${GlobalController.to.room.roundCount}',
                  style: TextStyle(color: Color.fromARGB(255, 162, 180, 227), fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                const Text(
                  'Winner',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                Text(
                  GlobalController.to.room.currentRound.winner!.name,
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
