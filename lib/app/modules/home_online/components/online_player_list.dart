import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/home_online/components/online_player_tile.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constant.dart';

class OnlinePlayerList extends StatelessWidget {
  const OnlinePlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firestoreService.getOtherOnlineUsers(),
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
                .map<Widget>((doc) => OnlinePlayerTile(doc: doc))
                .toList(),
          );
        });
  }
}

