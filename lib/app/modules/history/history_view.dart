import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/history/components/round_card.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  final roomId = Get.arguments;
  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final roomId = Get.arguments;
    print('build home screen...');
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(roomId),
      ),
    );
  }

  Container buildBody(roomId) {
    final rounds = GameController.to.room.rounds;
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                  horizontal: kPadding16, vertical: kPadding12),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: kPadding12);
              },
              itemCount: rounds!.length,
              itemBuilder: (context, index) {
                final round = rounds[index];
                return RoundCard(round: round!, roomId: roomId);
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kWhite,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        iconSize: kIconSize,
        color: kBlack,
        onPressed: () {
          Get.back();
        },
      ),
      title: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: kPadding8, right: kPadding48),
        child: Text('History', style: kTitle1),
      ),
    );
  }
}
