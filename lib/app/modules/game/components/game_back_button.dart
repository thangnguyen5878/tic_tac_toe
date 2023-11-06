import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
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
      icon: const Icon(
        Icons.arrow_back,
        color: kBlack,
        size: kIconSize,
      ),
      onPressed: () async {
        Get.back();
        await GameController.to.saveRoom();
        Get.toNamed(Routes.HOME);
      },
    );
  }
}