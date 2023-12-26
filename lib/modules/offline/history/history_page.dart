import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/offline/history/components/round_card.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  final roomId = Get.arguments;
  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final roomId = Get.arguments;
    logger.t('build home screen...');
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
          //     padding: EdgeInsets.only(top: 8, left: 16),
          //     child: Text('Room: ${room.name}', style: kHeading2)),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12);
              },
              itemCount:
                  rounds!.length + 1, // plus 1 since the title is included
              itemBuilder: (context, index) {
                if (index == 0) {
                  // This is the first item, which is the title
                  return Container(
                    alignment: Alignment.center,
                    color: kWhite,
                    child: Text('Room: ${room.name}', style: kHeading2),
                  );
                } else {
                  // List items
                  final round =
                      rounds[index - 1]; // minus 1 to convert to round index
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
        padding: const EdgeInsets.only(left: 16),
        icon: const Icon(Icons.arrow_back),
        iconSize: kIconSize,
        color: kBlack,
        onPressed: () {
          Get.back();
        },
      ),
      title: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 8, right: 48),
        child: const Column(
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
