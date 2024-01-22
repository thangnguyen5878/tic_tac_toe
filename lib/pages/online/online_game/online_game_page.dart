import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/board_widget.dart';
import 'package:flutter_tic_tac_toe/components/player_status_bar.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:get/get.dart';

class OnlineGamePage extends StatelessWidget {
  const OnlineGamePage({Key? key}) : super(key: key);

  void onBackPressed() {
    OnlineUserController.to.handleBackButtonOnGamePage();
  }

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
                onBackPressed();
              },
              child: Scaffold(
                appBar: _buildAppBar(),
                body: _buildBody(),
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

  Stack _buildBody() {
    final Room room = OnlineGameController.to.room;

    return Stack(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(height: 10),
              BoardWidget(room: room),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: PlayerStatusBar(
            room: room,
          )),
    ]);
  }

  AppBar _buildAppBar() {
    final Room room = OnlineGameController.to.room;

    return AppBar(
      backgroundColor: kBrown40,
      leading: _buildBackButton(),
      title: GetBuilder<OnlineGameController>(
        builder: (controller) {
          final room = OnlineGameController.to.room;
          final round = room.currentRound;

          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Room: ${room.name}', style: kHeading2),
            Text('Round: ${room.roundCount}, Turn: ${round.turnCount}', style: kHeading3),
          ]);
        },
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        // ignore: prefer_const_constructors
        if (room.isGameOver) _buildRematchButton(),
      ],
    );
  }

  Widget _buildBackButton() {
    return IconButton(
      padding: const EdgeInsets.only(left: 16),
      icon: const Icon(
        Icons.arrow_back,
        color: kBlack,
        size: kIconSize,
      ),
      onPressed: () async {
        onBackPressed();
      },
    );
  }

  Widget _buildRematchButton() {
    return IconButton(
      icon: const Icon(
        Icons.next_plan_outlined,
        color: kBlack,
        size: kIconSize,
      ),
      onPressed: () async {
        OnlineUserController.to.handlePressRematchButtonOnAppbar();
      },
    );
  }
}
