import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/board_widget.dart';
import 'package:flutter_tic_tac_toe/components/buttons/next_round_button.dart';
import 'package:flutter_tic_tac_toe/components/buttons/reset_board_button.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/offline_leave_game_dialog.dart';
import 'package:flutter_tic_tac_toe/components/player_status_bar.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:get/get.dart';

class GamePage extends StatelessWidget {
  final roomId = Get.arguments;
  void onBackPressed() {
    Get.dialog(OfflineLeaveGameDialog(), barrierDismissible: false);
  }

  GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('build game page');

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        onBackPressed();
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
                    BoardWidget(
                      room: room,
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: PlayerStatusBar(
                  room: room,
                )),
          ]),
        );
      }),
    );
  }

  AppBar _buildAppBar() {
    final room = GameController.to.room;
    final round = room.currentRound;

    return AppBar(
      backgroundColor: kBrown40,
      leading: _buildBackButton(),
      // titleSpacing: 0,
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Room: ${room.name}', style: kHeading2),
        Text('Round: ${room.roundCount}, Turn: ${round.turnCount}', style: kHeading3),
      ]),
      actions: [
        ResetBoardButton(),
        if (room.isGameOver) NextRoundButton(),
        _buildPopupMenuButton(),
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
      onPressed: () {
        onBackPressed();
      },
    );
  }

  _buildPopupMenuButton() {
    final room = GameController.to.room;
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'reset',
          child: Text('Reset'),
          // Remove the style parameter
        ),
        const PopupMenuItem<String>(
          value: 'history',
          child: Text('History'),
          // Remove the style parameter
        ),
      ],
      onSelected: (String value) async {
        if (value == 'reset') {
          GameController.to.resetBoard();
          await GameController.to.saveRoomToIsarDatabase();
        } else if (value == 'history') {
          logger.t('Going to History Page, roomId = $roomId');
          GameController.to.saveRoomToIsarDatabase();
          Get.toNamed(Routes.HISTORY, arguments: room.id);
        }
      },
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
        size: kIconSize, // Set the color of the three dots icon to black
      ),
    );
  }
}
