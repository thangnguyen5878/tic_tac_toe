import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
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
        final round = room.getCurrentRound();

        final xColor = round.currentPlayerIndex == 0 ? kBlack : kGrey45;
        final oColor = round.currentPlayerIndex == 1 ? kBlack : kGrey45;
        final xBoxColor = round.currentPlayerIndex == 0 ? kBrown30 : kGrey30;
        final oBoxColor = round.currentPlayerIndex == 1 ? kBrown30 : kGrey30;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Player 1 Box
            Expanded(
              child: Container(
                color: xBoxColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${round.getPlayer1().name}: X',
                      style:
                          TextStyle(color: xColor, fontWeight: FontWeight.bold),
                    ),
                    Text('Score: ${round.getPlayer1().score}',
                        style: TextStyle(
                            color: xColor, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            // Player 2 Box
            Expanded(
              child: Container(
                color: oBoxColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${round.getPlayer2().name}: O',
                      style:
                          TextStyle(color: oColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Score: ${round.getPlayer2().score}',
                      style:
                          TextStyle(color: oColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
