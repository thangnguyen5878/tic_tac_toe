import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/models/online/online_room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OnlineCellWidget extends StatelessWidget {
  final Map<String, dynamic> jsonRoom;
  final int row;
  final int column;

  const OnlineCellWidget({Key? key, required this.row, required this.column, required this.jsonRoom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnlineGameController>(builder: (controller) {
      debugPrint('build cell');
      final room = OnlineRoom.fromJson(jsonRoom);
      final round = room.getCurrentRound();
      final content = room.board.cells[row][column].content.toString();
      final state = room.board.cells[row][column].state!;

      Color bColor = Colors.white;
      if (state == CellState.crossWin) {
        bColor = kRed20;
      }
      if (state == CellState.noughtWin) {
        bColor = kGreen30;
      }
      if (state == CellState.normal) {
        bColor = Colors.white;
      }

      return InkWell(
        onTap: () {
          OnlineGameController.to.drawSeedOnCell(row, column, round.getCurrentPlayer().seed!);
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
