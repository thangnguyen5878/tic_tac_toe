import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:get/get.dart';

class HistoryDetailsBackButton extends StatelessWidget {
  final int roomId = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: kBlack,
        size: kIconSize,
      ),
      onPressed: () {
        GameController.to.pauseHistoryAutoPlay();
        Get.back();
      },
    );
  }
}
