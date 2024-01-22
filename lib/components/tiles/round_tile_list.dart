import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/tiles/round_tile.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class RoundTileList extends StatelessWidget {
  final Room room;

  const RoundTileList({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    logger.t('Build round tile list.');

    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  return RoundTile(room: room, roundIndex: index - 1);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
