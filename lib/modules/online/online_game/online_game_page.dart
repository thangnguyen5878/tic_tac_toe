import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';

class OnlineGamePage extends StatelessWidget {
  const OnlineGamePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if(didPop) return;
        OnlineUserController.to.quitGame();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('OnlineGameView'),
          centerTitle: true,
          leading: IconButton(
            padding: EdgeInsets.only(left: 16),
            icon: const Icon(
              Icons.arrow_back,
              color: kBlack,
              size: kIconSize,
            ),
            onPressed: () {
              OnlineUserController.to.quitGame();
            },
          ),
        ),
        body: const Center(
          child: Text(
            'OnlineGameView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
