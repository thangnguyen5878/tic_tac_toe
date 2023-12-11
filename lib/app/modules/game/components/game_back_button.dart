import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:get/get.dart';

class GameBackButton extends StatelessWidget {
  GameBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(left: kPadding16),
      icon: const Icon(
        Icons.arrow_back,
        color: kBlack,
        size: kIconSize,
      ),
      onPressed: () async {
        Get.back();
        print('Object before save: ${GameController.to.room}');
        final newId = await GameController.to.saveRoom();
        final room = await GameController.to.isarService.getRoom(newId);
        print('Object after save (from database): $room');
        Get.toNamed(Routes.HOME);
      },
    );
  }
}
