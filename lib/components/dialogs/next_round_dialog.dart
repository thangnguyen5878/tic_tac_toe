import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/custom_dialog.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class NextRoundDialog extends StatelessWidget {
  NextRoundDialog({super.key});

  final onNoButtonPressed = () {
    Get.back();
  };

  @override
  Widget build(BuildContext context) {
    logger.t('Show next round dialog.');
    return CustomDialog(
        title: "GO TO THE NEXT ROUND",
        content: "You've completed the current round. Would you like to go to the next round?",
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
        GameController.to.nextRound();
        await GameController.to.saveRoomToIsarDatabase();
        Get.back();
      },
      child: const Text('YES'),
    );
  }
}
