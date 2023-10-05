import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:get/get.dart';

class WinnerView extends StatelessWidget {
  final GameController game = Get.find<GameController>();

  WinnerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final winnerId = game.room.currentRound.winnerIndex;
    final winnerName = game.room.players[winnerId!].name;

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
                  'Round ${game.room.roundCount}',
                  style: TextStyle(
                      color: Color.fromARGB(255, 162, 180, 227),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
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