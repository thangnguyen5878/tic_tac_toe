import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OnlinePlayerBottomBar extends StatelessWidget {
  final Room room;

  const OnlinePlayerBottomBar({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.grey,
        height: 48,
        child: GetBuilder(builder: (OnlineGameController controller) {
          final room = OnlineGameController.to.room;
          final round = room.getCurrentRound();

          final xColor = round.currentPlayerIndex == 0 ? kBlack : kDarkGrey;
          final oColor = round.currentPlayerIndex == 1 ? kBlack : kDarkGrey;
          final xBoxColor = round.currentPlayerIndex == 0 ? kBrown35 : kLightGrey;
          final oBoxColor = round.currentPlayerIndex == 1 ? kBrown35 : kLightGrey;

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
                        '${room.getPlayer1().name}: X',
                        style: TextStyle(color: xColor, fontWeight: FontWeight.bold),
                      ),
                      Text('Score: ${room.getPlayer1Score().currentScore}',
                          style: TextStyle(color: xColor, fontWeight: FontWeight.bold)),
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
                        '${room.getPlayer2().name}: O',
                        style: TextStyle(color: oColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Score: ${room.getPlayer2Score().currentScore}',
                        style: TextStyle(color: oColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
