import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/components/next_round_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/board_widget.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/cell_widget.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
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
        gameController.saveRoom();
        Get.toNamed(Routes.HOME);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBrown40,
          title: GetBuilder<GameController>(
            builder: (game) {
              return Text(
                'Round: ${game.room.roundCount}, Turn: ${game.room.currentRound.turnCount}',
                style: const TextStyle(fontSize: 18, color: kBlack),
              );
            },
          ),
          leading: BackButton(gameController: gameController),
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

class GamePopupMenuButton extends StatelessWidget {
  GamePopupMenuButton({
    super.key,
    required this.gameController,
    required this.roomId,
  });

  final GameController gameController;
  var roomId;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'reset',
          child: Text('Reset'),
          // Remove the style parameter
        ),
        PopupMenuItem<String>(
          value: 'history',
          child: Text('History'),
          // Remove the style parameter
        ),
      ],
      onSelected: (String value) async {
        if (value == 'reset') {
          gameController.resetBoard();
          gameController.saveRoom();
        } else if (value == 'history') {
          print('Going to History Page, roomId = $roomId');
          roomId = await gameController.saveRoom();
          Get.toNamed(Routes.HISTORY, arguments: roomId);
        }
      },
      icon: Icon(
        Icons.more_vert,
        color: Colors.black, // Set the color of the three dots icon to black
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
    required this.gameController,
  });

  final GameController gameController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: kBlack,
      ),
      onPressed: () {
        Get.back();
        gameController.saveRoom();
        Get.toNamed(Routes.HOME);
        // FocusScope.of(context).unfocus();
      },
    );
  }
}
