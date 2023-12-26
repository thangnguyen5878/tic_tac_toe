import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/models/online/online_room.dart';
import 'package:flutter_tic_tac_toe/models/online/online_user.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/cell_widget.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/online_cell_widget.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class OnlineBoardWidget extends StatelessWidget {
  const OnlineBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final columnCount = OnlineGameController.to.room.board.columnCount;
    final rowCount = OnlineGameController.to.room.board.rowCount;
    logger.t('build online board ($rowCount, $columnCount)');

    return StreamBuilder(
      stream: firestoreService.watchRoom("ec483c14-f414-44ae-bea1-b84e409331f0"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            Map<String, dynamic> json = snapshot.data!.data()!;
            logger.i(json);
            OnlineRoom room = OnlineRoom.fromJson(json);
            logger.i(room);
            return Text(room.toString(), style: kNormalText,);

          }
        },
    );
  }
}
