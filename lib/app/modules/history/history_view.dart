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
    final room = GameController.to.room;
    final rounds = GameController.to.room.rounds;
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //     padding: EdgeInsets.only(top: kPadding8, left: kPadding16),
          //     child: Text('Room: ${room.name}', style: kHeading2)),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                  horizontal: kPadding16, vertical: kPadding12),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: kPadding12);
              },
              itemCount: rounds!.length + 1, // plus 1 since the title is included
              itemBuilder: (context, index) {
                if (index == 0) {
                  // This is the first item, which is the title
                  return Container(
                    alignment: Alignment.center,
                    color: kWhite,
                    child: Text(
                        'Room: ${room.name}',
                        style: kHeading2),
                  );
                } else {
                  // List items
                  final round = rounds[index - 1]; // minus 1 to convert to round index
                  return RoundCard(round: round!, roomId: roomId);
                }
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
        padding: EdgeInsets.only(left: kPadding16),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('History', style: kTitle1),
            // Text('Room: ${room.name}', style: kHeading3),
          ],
        ),
      ),
    );
  }
}
