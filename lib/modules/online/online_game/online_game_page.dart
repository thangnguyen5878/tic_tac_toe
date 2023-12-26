import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/game_popup_menu_button.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/next_round_button.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/online_board_widget.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/online_game_back_button.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

class OnlineGamePage extends StatelessWidget {
  const OnlineGamePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if(didPop) return;
        OnlineUserController.to.quitGame();
      },
      child: Scaffold(
        // appBar: buildAppBar(),
        body: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 10),
                  OnlineBoardWidget(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          // Positioned(bottom: 0, left: 0, right: 0, child: OnlinePlayerBottomBar()),
        ]),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kBrown40,
      leading: OnlineGameBackButton(),
      title: GetBuilder<GameController>(
        builder: (gameController) {
          final room = GameController.to.room;
          final round = room.getCurrentRound();
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Online Game Page, Room: ${room.name}', style: kHeading2),
                Text(
                    'Round: ${room.getRoundCount()}, Turn: ${round.getTurnCount()}',
                    style: kHeading3),
              ]);
        },
      ),
      actions: [
        // buildResetBoardButton(),
        NextRoundButton(),
        GamePopupMenuButton(),
      ],
    );
  }
}
