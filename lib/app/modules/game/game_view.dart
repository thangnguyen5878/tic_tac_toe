import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/components/board_widget.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/components/game_back_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/components/game_popup_menu_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/components/next_round_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/components/player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:get/get.dart';

class GameView extends StatelessWidget {
  final roomId = Get.arguments;

  GameView({super.key});
  @override
  Widget build(BuildContext context) {
    print('build game page...');

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        await GameController.to.saveRoom();
        Get.toNamed(Routes.HOME);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBrown40,
          title: GetBuilder<GameController>(
            builder: (gameController) {
              final room = GameController.to.room;
              final round = room.getCurrentRound();

              return Text(
                'Round: ${room.getRoundCount()}, Turn: ${round.getTurnCount()}',
                style: const TextStyle(fontSize: 18, color: kBlack),
              );
            },
          ),
          leading: GameBackButton(),
          actions: [
            // buildResetBoardButton(),
            NextRoundButton(),
            GamePopupMenuButton(),
          ],
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
          Positioned(bottom: 0, left: 0, right: 0, child: PlayerBottomBar()),
        ]),
      ),
    );
  }
}




