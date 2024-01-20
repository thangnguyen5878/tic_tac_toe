import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/dialogs/reset_board_dialog.dart';
import 'package:get/get.dart';

class ResetBoardButton extends StatelessWidget {
  const ResetBoardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.refresh,
      ),
      onPressed: () async {
        Get.dialog(ResetBoardDialog(), barrierDismissible: false);
      },
    );
  }
}
