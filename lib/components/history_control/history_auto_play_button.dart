import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class HistoryAutoPlayButton extends StatelessWidget {
  final bool isAutoPlay;

  const HistoryAutoPlayButton({super.key, required this.isAutoPlay});

  @override
  Widget build(BuildContext context) {
    IconData icon = isAutoPlay == false ? Icons.play_arrow : Icons.pause;
    return ElevatedButton(
      onPressed: () {
        if (isOffline) {
          logger.t('Press Auto Play Button');
          GameController.to.toggleHistoryAutoPlay();
        }
      },
      style: TextButton.styleFrom(elevation: 1, backgroundColor: kPurple),
      child: Icon(icon, color: Colors.black, size: 35),
    );
  }
}
