import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/offline_drawer.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_waiting_room/components/online_drawer.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    if (AuthController.to.user.value == null) {
      return OfflineDrawer();
    } else {
      return OnlineDrawer();
    }
  }
}
