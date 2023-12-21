import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/online_user_tile.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constant.dart';

class OnlineUserList extends StatelessWidget {
  const OnlineUserList({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build online user list');
    return StreamBuilder(
        stream: firestoreService.getOnlineUsers(),
        builder: (context, snapshot) {

          // error
          if (snapshot.hasError) {
            debugPrint('ERROR: ${snapshot.error}');
            return Text('ERROR: ${snapshot.error}');
          }
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('loading');
          }
          // load info
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => OnlineUserTile(doc: doc))
                .toList(),
          );
        });
  }
}

