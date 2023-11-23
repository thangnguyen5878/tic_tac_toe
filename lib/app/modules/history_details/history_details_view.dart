import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/control_bar.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/history_board.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/history_player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

import 'package:get/get.dart';

import 'history_details_controller.dart';

class HistoryDetailsView extends GetView<HistoryDetailsController> {
  HistoryDetailsView({Key? key}) : super(key: key);

  // final roomId = Get.arguments[0];
  // final roundNumber = Get.arguments[1] - 1;

  @override
  Widget build(BuildContext context) {
    print('build history details page...');
    final round = GameController.to.room.getHistoryRound();

    round.resetHistory();

    return WillPopScope(
      onWillPop: () async {
        GameController.to.pauseHistoryAutoPlay();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: kBrown40_history,
          leading: IconButton(
          padding: EdgeInsets.only(left: kPadding16),
          icon: const Icon(
            Icons.arrow_back,
            color: kBlack,
            size: kIconSize,
          ),
          onPressed: () {
            GameController.to.pauseHistoryAutoPlay();
            Get.back();
          },
        ),
        title: GetBuilder<GameController>(
          builder: (gameController) {
            final room = GameController.to.room;
            final round = GameController.to.room.getHistoryRound();

            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Room: ${room.name}',
                      style: kHeading2
                  ),
                  Text(
                      'Round: ${room.getHistoryRoundCount()}, Turn: ${round.getHistoryTurnCount()}',
                      style: kHeading3
                  ),
                ]
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

