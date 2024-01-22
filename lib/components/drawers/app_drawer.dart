import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/drawers/offline_drawer.dart';
import 'package:flutter_tic_tac_toe/components/drawers/online_drawer.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';

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
