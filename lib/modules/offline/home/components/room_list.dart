import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_card.dart';
import 'package:get/get.dart';

class RoomList extends StatelessWidget {
  const RoomList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(height: 4),
          GetBuilder<GameController>(
            builder: (gameController) {
              return FutureBuilder<List<Room>>(
                future: GameController.to.isarService.getAllRooms(),
                builder: (context, snapshot) {
                  // error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Đã xảy ra lỗi'),
                    );
                    // no data
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('Không có phòng nào'),
                    );
                    // has data
                  } else if (snapshot.hasData) {
                    final rooms = snapshot.data!;
                    return Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return SizedBox(height: 12);
                        },
                        itemCount: rooms.length,
                        itemBuilder: (context, index) {
                          final room = rooms[index];
                          return RoomCard(room, index);
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
    );
  }
}