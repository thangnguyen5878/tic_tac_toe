import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/dialogs/online_winner_dialog.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OnlineRematchButton extends StatelessWidget {
  const OnlineRematchButton({
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
              Icons.next_plan_outlined,
              color: kBlack,
              size: kIconSize,
            ),
            onPressed: () async {
              Get.dialog(OnlineWinnerDialog(), barrierDismissible: false);
            },
          );
        }
        return Container();
      },
    );
  }
}
