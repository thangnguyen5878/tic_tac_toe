import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OnlineResetBoardButton extends StatelessWidget {
  const OnlineResetBoardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (gameController) {
        return IconButton(
          icon: const Icon(
            Icons.refresh,
          ),
          onPressed: () async {
            GameController.to.resetBoard();
            await GameController.to.saveRoomToIsarDatabase();
          },
        );
      },
    );
  }
}
