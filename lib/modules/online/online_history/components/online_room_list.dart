import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore for StreamBuilder
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_history/components/online_room_card.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class OnlineRoomList extends StatelessWidget {
  const OnlineRoomList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const SizedBox(height: 4),
          GetBuilder<OnlineGameController>(
            builder: (controller) {
              return StreamBuilder<QuerySnapshot<Object?>>(
                // Specify type of StreamBuilder
                stream: firestoreService.watchAllRoomsOfAUser(firebaseAuth.currentUser!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final rooms = snapshot.data!.docs; // Access rooms from snapshot.data
                    return Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemCount: rooms.length,
                        itemBuilder: (context, index) {
                          final room = rooms[index].data() as Room;
                          return OnlineRoomCard(room: room);
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // Handle errors
                    debugPrint('Error fetching rooms: ${snapshot.error}');
                    return const Center(child: Text('Error loading rooms'));
                  } else {
                    // Loading state
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
