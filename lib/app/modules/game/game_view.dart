import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/components/game_back_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/components/game_popup_menu_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/components/next_round_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/board_widget.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:get/get.dart';

class GameView extends StatelessWidget {
  final roomId = Get.arguments;
  final GameController gameController = Get.find<GameController>();

  GameView({super.key});
  @override
  Widget build(BuildContext context) {
    print('build game page...');

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        await gameController.saveRoom();
        Get.toNamed(Routes.HOME);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBrown40,
          title: GetBuilder<GameController>(
            builder: (gameController) {
              final currentRoundIndex = gameController.room.currentRoundIndex;
              final currentTurnIndex = gameController.room.rounds![currentRoundIndex]!.currentTurnIndex;
              return Text(
                'Round: ${currentRoundIndex + 1}, Turn: ${currentTurnIndex! + 1}',
                style: const TextStyle(fontSize: 18, color: kBlack),
              );
            },
          ),
          leading: GameBackButton(gameController: gameController),
          actions: [
            // buildResetBoardButton(),
            NextRoundButton(),
            GamePopupMenuButton(gameController: gameController, roomId: roomId),
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




