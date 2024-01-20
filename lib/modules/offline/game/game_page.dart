import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/board_widget.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/game_popup_menu_button.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/next_round_button.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class GamePage extends StatelessWidget {
  final roomId = Get.arguments;

  GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('build game page');

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        GameController.to.handleBackFromGamePage();
      },
      child: GetBuilder<GameController>(builder: (controler) {
        Room room = GameController.to.room;
        return Scaffold(
          appBar: _buildAppBar(),
          body: Stack(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 10),
                    BoardWidget(room: room),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: PlayerBottomBar(
                  room: room,
                )),
          ]),
        );
      }),
    );
  }

  AppBar _buildAppBar() {
    final room = GameController.to.room;
    final round = room.getCurrentRound();

    return AppBar(
      backgroundColor: kBrown40,
      leading: _buildBackButton(),
      // titleSpacing: 0,
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Room: ${room.name}', style: kHeading2),
        Text('Round: ${room.getRoundCount()}, Turn: ${round.getTurnCount()}', style: kHeading3),
      ]),
      actions: [
        // buildResetBoardButton(),
        NextRoundButton(),
        GamePopupMenuButton(),
      ],
    );
  }

  Widget _buildBackButton() {
    return IconButton(
      padding: EdgeInsets.only(left: 16),
      icon: const Icon(
        Icons.arrow_back,
        color: kBlack,
        size: kIconSize,
      ),
      onPressed: () async {
        GameController.to.handleBackFromGamePage();
      },
    );
  }
}
