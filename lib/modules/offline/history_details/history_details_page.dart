import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/modules/offline/history_details/components/control_bar.dart';
import 'package:flutter_tic_tac_toe/modules/offline/history_details/components/history_board.dart';
import 'package:flutter_tic_tac_toe/modules/offline/history_details/components/history_player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class HistoryDetailsPage extends StatelessWidget {
  const HistoryDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.t('build history details page...');
    final round = GameController.to.room.getHistoryRound();

    round.resetHistory();

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        GameController.to.pauseHistoryAutoPlay();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBrown40_history,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 16),
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

              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Room: ${room.name}', style: kHeading2),
                Text('Round: ${room.getHistoryRoundCount()}, Turn: ${round.getHistoryTurnCount()}',
                    style: kHeading3),
              ]);
            },
          ),
        ),
        body: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  SizedBox(height: 10),
                  HistoryBoard(),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
          const Positioned(
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
