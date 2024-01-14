import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/modules/offline/history/components/round_card.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

class RoundCardList extends StatelessWidget {
  const RoundCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final room = GameController.to.room;
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12);
              },
              itemCount: room.getRoundCount() + 1, // plus 1 since the title is included
              itemBuilder: (context, index) {
                if (index == 0) {
                  // This is the first item, which is the title
                  return Container(
                    alignment: Alignment.center,
                    color: kWhite,
                    child: Text('Room: ${room.name}', style: kHeading2),
                  );
                } else {
                  // minus 1 to convert to round index
                  return RoundCard(roundIndex: index - 1);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}