import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/modules/offline/history/components/round_card_list.dart';
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
    final room = GameController.to.room;
    logger.t('Build History Page.');
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: RoundCardList(room: room),
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
          ],
        ),
      ),
    );
  }
}
