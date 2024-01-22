import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/drawers/online_drawer.dart';
import 'package:flutter_tic_tac_toe/components/tiles/online_user_list.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

class OnlineWaitingRoomPage extends StatefulWidget {
  const OnlineWaitingRoomPage({Key? key}) : super(key: key);

  @override
  State<OnlineWaitingRoomPage> createState() => _OnlineWaitingRoomPageState();
}

class _OnlineWaitingRoomPageState extends State<OnlineWaitingRoomPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    bool isOnline = state == AppLifecycleState.resumed || state == AppLifecycleState.inactive;

    if (isOnline) {
      AuthController.to.updateUserOnlineStatus(true);
    } else {
      AuthController.to.updateUserOnlineStatus(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const OnlineDrawer(),
      appBar: AppBar(
        title: const Text(
          'Tic-tac-toe Online',
          style: kTitle1,
        ),
        centerTitle: true,
      ),
      body: const OnlineUserList(),
    );
  }
}
