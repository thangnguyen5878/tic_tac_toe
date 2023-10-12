import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';

import 'package:get/get.dart';

import 'history_controller.dart';

class HistoryView extends StatelessWidget {
  final roomId = Get.arguments;
  final GameController gameController = Get.find<GameController>();
  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final roomId = Get.arguments;
    print('build home screen...');
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text('History', style: TextStyle(fontSize: 30)),
              GetBuilder<GameController>(
                builder: (gameController) {
                  return FutureBuilder<List<Round?>?>(
                    future:
                        gameController.isarService.getAllRoundsInRoom(roomId),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Đã xảy ra lỗi'),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text('Không có phòng nào'),
                        );
                      } else if (snapshot.hasData) {
                        final rounds = snapshot.data!;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: rounds.length,
                            itemBuilder: (context, index) {
                              final round = rounds[index];
                              final winnerIndex = round!.winnerIndex;
                              final player1 = round.players![0];
                              final player2 = round.players![1];

                              return ListTile(
                                onTap: () => Get.toNamed(Routes.HISTORY_DETAILS),
                                title: Text('Round ${round!.number}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (winnerIndex != null)
                                      Text('Winner: ${round.players![winnerIndex].name}'),
                                    Text('${player1.name} (${player1.score}) - ${player2.name} (${player2.score})'),
                                  ],
                                ),
                                // Add more widgets to display additional room information
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
