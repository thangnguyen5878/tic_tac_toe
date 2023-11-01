import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/next_turn_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/history_auto_play_button.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/previous_turn_button.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';

class ControlBar extends StatelessWidget {
  const ControlBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kBrown10,
          height: 50,
        ),
        Positioned(left: 5, width: 90, child: HistoryAutoPlayButton()),
        Positioned(
          right: 5,
          child: Row(
            children: [
              PreviousTurnButton(),
              const SizedBox(
                width: 5,
              ),
              NextTurnButton(),
            ],
          ),
        ),
      ],
    );
  }
}
