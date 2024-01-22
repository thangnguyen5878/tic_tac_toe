import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/custom_dialog.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class ResetBoardDialog extends StatelessWidget {
  ResetBoardDialog({super.key});

  final onNoButtonPressed = () {
    Get.back();
  };

  @override
  Widget build(BuildContext context) {
    logger.t('Show reset board dialog.');
    return CustomDialog(
        title: "RESET BOARD!",
        content:
            "Are you sure you want to reset the board? All the seed on the board will be removed and the game will start from the beginning of this round.",
        onBackPress: () {
          logger.t('Press back button.');
          onNoButtonPressed();
        },
        children: [_buildNoButton(), _buildYesButton()]);
  }

  TextButton _buildNoButton() {
    return TextButton(
      onPressed: () {
        logger.t('Press NO button.');
        onNoButtonPressed();
      },
      child: const Text('NO'),
    );
  }

  TextButton _buildYesButton() {
    return TextButton(
      onPressed: () async {
        logger.t('Press YES button.');
        GameController.to.resetBoard();
        await GameController.to.saveRoomToIsarDatabase();
        Get.back();
      },
      child: const Text('YES'),
    );
  }
}
