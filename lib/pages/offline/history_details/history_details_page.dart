import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/board_widget.dart';
import 'package:flutter_tic_tac_toe/components/history_control/control_bar.dart';
import 'package:flutter_tic_tac_toe/components/player_status_bar.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:get/get.dart';

class HistoryDetailsPage extends StatelessWidget {
  HistoryDetailsPage({Key? key}) : super(key: key);

  final room = GameController.to.room;

  void onBackPressed() {
    GameController.to.pauseHistoryAutoPlay();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    logger.t('build history details page');

    room.history.reset();

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        onBackPressed();
      },
      child: GetBuilder<GameController>(builder: (controller) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        );
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kBrown30,
      leading: _buildBackButton(),
      title: _buildTitle(),
    );
  }

  Widget _buildTitle() {
    final room = GameController.to.room;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Room: ${room.name}', style: kHeading2),
      Text('Round: ${room.getRoundCountInHistory()}, Turn: ${room.getTurnCountInHistory()}',
          style: kHeading3),
    ]);
  }

  IconButton _buildBackButton() {
    return IconButton(
      padding: const EdgeInsets.only(left: 16),
      icon: const Icon(
        Icons.arrow_back,
        color: kBlack,
        size: kIconSize,
      ),
      onPressed: () {
        onBackPressed();
      },
    );
  }

  Stack _buildBody() {
    final room = GameController.to.room;

    return Stack(children: [
      Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 10),
              BoardWidget(
                room: room,
                isHistory: true,
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Column(
          children: [
            PlayerStatusBar(
              room: room,
              isHistory: true,
            ),
            HistoryControlBar(room: room)
          ],
        ),
      ),
    ]);
  }
}
