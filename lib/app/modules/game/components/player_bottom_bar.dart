import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PlayerBottomBar extends StatelessWidget {
  const PlayerBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 48,
      child: GetBuilder(builder: (GameController gameController) {
        final room = GameController.to.room;
        final round = room.currentRound;

        final isPlayer1 = round.currentPlayerIndex == 0;
        final isPlayer2 = round.currentPlayerIndex == 1;

        final player1TextColor = isPlayer1 ? kBlack : kGrey45;
        final player1ContainerColor = isPlayer1 ? kBrown30 : kGrey30;
        final player2TextColor = isPlayer2 ? kBlack : kGrey45;
        final player2ContainerColor = isPlayer2 ? kBrown30 : kGrey30;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Player1Container(
                round: round,
                player1ContainerColor: player1ContainerColor,
                player1TextColor: player1TextColor),
            Player2Container(
                round: round,
                player2ContainerColor: player2ContainerColor,
                player2TextColor: player2TextColor),
          ],
        );
      }),
    );
  }
}

class Player2Container extends StatelessWidget {
  const Player2Container({
    super.key,
    required this.player2ContainerColor,
    required this.round,
    required this.player2TextColor,
  });

  final Color player2ContainerColor;
  final Round round;
  final Color player2TextColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: player2ContainerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${round.player2.name}: O',
              style: TextStyle(
                  color: player2TextColor, fontWeight: FontWeight.bold),
            ),
            Text(
              'Score: ${round.player2.score}',
              style: TextStyle(
                  color: player2TextColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Player1Container extends StatelessWidget {
  const Player1Container({
    super.key,
    required this.player1ContainerColor,
    required this.round,
    required this.player1TextColor,
  });

  final Color player1ContainerColor;
  final Round round;
  final Color player1TextColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: player1ContainerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${round.player1.name}: X',
              style: TextStyle(
                  color: player1TextColor, fontWeight: FontWeight.bold),
            ),
            Text('Score: ${round.player1.score}',
                style: TextStyle(
                    color: player1TextColor, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
