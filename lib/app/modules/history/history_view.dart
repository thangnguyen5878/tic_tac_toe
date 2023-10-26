import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/history/components/round_card.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';

import 'package:get/get.dart';


class HistoryView extends StatelessWidget {
  final roomId = Get.arguments;
  final GameController gameController = Get.find<GameController>();
  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final roomId = Get.arguments;
    print('build home screen...');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              GetBuilder<GameController>(
                builder: (gameController) {
                  return FutureBuilder<List<Round?>?>(
                    future:
                        gameController.isarService.getAllRoundsInRoom(roomId),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Đã xảy ra lỗi'),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text('Không có phòng nào'),
                        );
                      } else if (snapshot.hasData) {
                        final rounds = snapshot.data!;
                        return Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: kPadding16, vertical: kPadding12),
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: kPadding12);
                            },
                            itemCount: rounds.length,
                            itemBuilder: (context, index) {
                              final round = rounds[index];
                              return RoundCard(round: round!, roomId: roomId,);
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
