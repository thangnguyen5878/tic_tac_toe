// import 'package:flutter/material.dart';
// import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';

// import 'package:get/get.dart';

// import 'history_controller.dart';

// class HistoryView extends StatelessWidget {
//   final GameController gameController = Get.find<GameController>();
//   HistoryView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final roomId = Get.arguments;
//     print('build home screen...');
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           alignment: Alignment.topCenter,
//           child: Column(
//             children: [
//               Text('History', style: TextStyle(fontSize: 30)),
//               GetBuilder<GameController>(
//                 builder: (gameController) {
//                   return FutureBuilder<List<Room>>(
//                     future: gameController.isarService.getRoom(roomId),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         final rooms = snapshot.data!;
//                         return Expanded(
//                           child: ListView.builder(
//                             itemCount: rooms.length,
//                             itemBuilder: (context, index) {
//                               final room = rooms[index];
//                               return ListTile(
//                                 onTap: () => Get.toNamed(Routes.GAME,
//                                     arguments: room.id),
//                                 title: Text(room.name),
//                                 subtitle: Text(
//                                     '${room.players[0].name} (${room.players[0].score}) - ${room.players[1].name} (${room.players[1].score}), round: ${room.roundCount}'),
//                                 // Add more widgets to display additional room information
//                               );
//                             },
//                           ),
//                         );
//                       } else if (snapshot.hasError) {
//                         return Center(
//                           child: Text('Đã xảy ra lỗi'),
//                         );
//                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                         return Center(
//                           child: Text('Không có phòng nào'),
//                         );
//                       } else {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                     },
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
