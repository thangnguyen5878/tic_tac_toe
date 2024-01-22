import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/history_control/history_auto_play_button.dart';
import 'package:flutter_tic_tac_toe/components/history_control/next_turn_button.dart';
import 'package:flutter_tic_tac_toe/components/history_control/previous_turn_button.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:gap/gap.dart';

class HistoryControlBar extends StatelessWidget {
  final Room room;

  const HistoryControlBar({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kBrown10,
          height: 50,
        ),
        Positioned(
            left: 5, width: 90, child: HistoryAutoPlayButton(isAutoPlay: room.history.isAutoPlay)),
        const Positioned(
          right: 5,
          child: Row(
            children: [
              HistoryPreviousTurnButton(),
              Gap(5),
              HistoryNextTurnButton(),
            ],
          ),
        ),
      ],
    );
  }
}
