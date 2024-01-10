import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_card.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
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
          const SizedBox(height: 4),
          GetBuilder<GameController>(
            builder: (gameController) {
              return StreamBuilder<List<Room>>(
                stream: isarService.watchAllRooms(),
                builder: (context, snapshot) {
                  // error
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Đã xảy ra lỗi'),
                    );
                    // no data
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Không có phòng nào'),
                    );
                    // has data
                  } else if (snapshot.hasData) {
                    final rooms = snapshot.data!;
                    return Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return const SizedBox(height: 12);
                        },
                        itemCount: rooms.length,
                        itemBuilder: (context, index) {
                          final room = rooms[index];
                          return RoomCard(room, index);
                        },
                      ),
                    );
                  } else {
                    return const Center(
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