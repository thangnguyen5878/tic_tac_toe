import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/history/components/history_details_back_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/control_bar.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/history_board.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/history_player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get.dart';

import 'history_details_controller.dart';

class HistoryDetailsView extends GetView<HistoryDetailsController> {
  HistoryDetailsView({Key? key}) : super(key: key);

  // final roomId = Get.arguments[0];
  // final roundNumber = Get.arguments[1] - 1;

  @override
  Widget build(BuildContext context) {
    final room = GameController.to.room;
    final round = room.historyRound;
    print('build history details page...');

    return WillPopScope(
      onWillPop: () async {
        GameController.to.pauseHistoryAutoPlay();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBrown40,
          leading: HistoryDetailsBackButton(),
          title: GetBuilder<GameController>(
            builder: (gameController) {
              return Text(
                'Round: ${room.historyRoundCount}, Turn: ${round.historyTurnCount}',
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
                  HistoryBoard(),
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
              children: [HistoryPlayerBottomBar(), ControlBar()],
            ),
          ),
        ]),
      ),
    );
  }
}
