import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/home/home_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/custom_text.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeView extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print('build home screen...');
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text('Tic-tac-toe', style: kHeading1),
              GetBuilder<GameController>(
                builder: (gameController) {
                  return FutureBuilder<List<Room>>(
                    future: gameController.isarService.getAllRooms(),
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
                        final rooms = snapshot.data!;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: rooms.length,
                            itemBuilder: (context, index) {
                              final room = rooms[index];
                              final player1 = room.currentRound.players![0];
                              final player2 = room.currentRound.players![1];
                              return InkWell(
                                onTap: () async {
                                  await gameController.loadRoomById(room.id);
                                  Get.toNamed(Routes.GAME, arguments: room.id);
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(room.name),
                                      Text(
                                        '${player1.name} (${player1.score}) - ${player2.name} (${player2.score}), round: ${room.roundCount}',
                                      ),
                                      // Add more widgets to display additional room information
                                    ],
                                  ),
                                ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.CREATE_ROOM);
          },
          child: Icon(Icons.add),
          backgroundColor: kBrown40,
        ),
      ),
    );
  }
}
