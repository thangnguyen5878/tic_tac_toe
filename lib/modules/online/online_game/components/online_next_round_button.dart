import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OnlineNextRoundButton extends StatelessWidget {
  const OnlineNextRoundButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final room = OnlineGameController.to.room;

    return GetBuilder<OnlineGameController>(
      builder: (controller) {
        if (room.isGameOver()) {
          return IconButton(
            icon: const Icon(
              Icons.forward,
              color: kBlack,
              size: kIconSize,
            ),
            onPressed: () async {
              OnlineGameController.to.nextRound();
            },
          );
        }
        return Container();
      },
    );
  }
}
