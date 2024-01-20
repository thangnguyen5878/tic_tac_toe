import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/online_board_widget.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/online_game_back_button.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/online_player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/online_rematch_button.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class OnlineGamePage extends StatelessWidget {
  const OnlineGamePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firestoreService.watchRoom(OnlineGameController.to.currentRoomId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Room room = snapshot.data!.data()! as Room;
            OnlineGameController.to.room = room;

            return PopScope(
              canPop: false,
              onPopInvoked: (didPop) {
                if (didPop) return;
                OnlineUserController.to.handleBackButtonOnGamePage();
              },
              child: Scaffold(
                appBar: _buildAppBar(),
                body: _buildBody(room),
              ),
            );
          } else {
            logger.t('No data. Room id: ${OnlineGameController.to.currentRoomId}');
            return const Text(
              'no data',
              style: kNormalText,
            );
          }
        });
  }

  Stack _buildBody(Room room) {
    return Stack(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(height: 10),
              OnlineBoardWidget(room: room),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
      OnlinePlayerBottomBar(room: room),
    ]);
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kBrown40,
      leading: const OnlineGameBackButton(),
      title: GetBuilder<OnlineGameController>(
        builder: (controller) {
          final room = OnlineGameController.to.room;
          final round = room.getCurrentRound();

          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Room: ${room.name}', style: kHeading2),
            Text('Round: ${room.getRoundCount()}, Turn: ${round.getTurnCount()}', style: kHeading3),
          ]);
        },
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        // ignore: prefer_const_constructors
        OnlineRematchButton(),
      ],
    );
  }
}
