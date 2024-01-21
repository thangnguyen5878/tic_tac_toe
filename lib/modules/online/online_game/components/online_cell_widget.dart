import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OnlineCellWidget extends StatelessWidget {
  final Room room;
  final int row;
  final int column;

  const OnlineCellWidget({Key? key, required this.row, required this.column, required this.room})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnlineGameController>(builder: (controller) {
      // debugPrint('build cell');
      final round = room.getCurrentRound();
      final content = room.board.cells[row][column].content.toString();
      final state = room.board.cells[row][column].state!;

      Color bColor = Colors.white;
      if (state == CellState.crossWin) {
        bColor = kLightPink;
      }
      if (state == CellState.noughtWin) {
        bColor = kLightGreen;
      }
      if (state == CellState.normal) {
        bColor = Colors.white;
      }

      return InkWell(
        onTap: () {
          if (OnlineUserController.to.currentUser.playerIndex == round.currentPlayerIndex) {
            OnlineGameController.to.drawSeedOnCell(row, column, room.getCurrentPlayer().seed!);
            logger.t('tap cell, player index: ${OnlineUserController.to.currentUser.playerIndex}');
          }
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: kBlack, width: 1),
            color: bColor,
          ),
          child: Text(
            content,
            style: const TextStyle(fontSize: 20, color: kBlack),
          ),
        ),
      );
    });
  }
}
