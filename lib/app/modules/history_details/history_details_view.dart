import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/history/components/history_details_back_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/control_bar.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/next_turn_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/play_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/board_widget.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/previous_turn_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/cell_widget.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';

import 'package:get/get.dart';

import 'history_details_controller.dart';

class HistoryDetailsView extends GetView<HistoryDetailsController> {
  HistoryDetailsView({Key? key}) : super(key: key);
  final roomId = Get.arguments;
  final GameController gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    print('build history details page...');

    return WillPopScope(
      onWillPop: () async {
        // Get.back();
        // Get.toNamed(Routes.HISTORY_DETAILS);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: kBrown40,
        leading: HistoryDetailsBackButton(gameController: gameController,),
        title: GetBuilder<GameController>(
          builder: (game) {
            return Text(
              'Round: ${game.room.roundCount}, Turn: ${game.room.currentRound.turnCount! + 1}',
              style: const TextStyle(fontSize: 18, color: kBlack),
            );
          },
        ),

      ),
        body: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 10),
                  BoardWidget(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [PlayerBottomBar(), ControlBar()],
            ),
          ),
        ]),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
        Get.toNamed(Routes.HISTORY_DETAILS);
        // FocusScope.of(context).unfocus();
      },
    );
  }
}
