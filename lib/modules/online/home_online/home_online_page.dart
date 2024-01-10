import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/app_drawer.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/online_user_list.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';

class HomeOnlinePage extends StatefulWidget {
  const HomeOnlinePage({Key? key}) : super(key: key);

  @override
  State<HomeOnlinePage> createState() => _HomeOnlinePageState();
}

class _HomeOnlinePageState extends State<HomeOnlinePage> with WidgetsBindingObserver {
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
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Home Online'),
        centerTitle: true,
      ),
      body: const OnlineUserList(),
    );
  }
}
