import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:get/get.dart';

class WinnerPage extends StatelessWidget {

  const WinnerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final room = GameController.to.room;
    final round = room.getCurrentRound();

    final winnerName = round.getWinner().name;
    final roundCount = room.getRoundCount();

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
                  'Round $roundCount',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 162, 180, 227),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Winner',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                Text(
                  winnerName!,
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
