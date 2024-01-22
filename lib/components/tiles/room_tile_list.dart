import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/tiles/room_tile.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:get/get.dart';

class RoomTileList extends StatelessWidget {
  const RoomTileList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    logger.t('Build room tile list.');
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const SizedBox(height: 4),
          GetBuilder<GameController>(
            builder: (gameController) {
              return StreamBuilder(
                stream: isarService.watchAllRooms(),
                builder: (context, snapshot) {
                  // error
                  if (snapshot.hasError) {
                    logger.e('ERROR: ${snapshot.error}');
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
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 12);
                        },
                        itemCount: rooms.length,
                        itemBuilder: (context, index) {
                          final room = rooms[index];
                          return RoomTile(room);
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
