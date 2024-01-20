import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/online_user.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_waiting_room/components/online_user_tile.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class OnlineUserList extends StatelessWidget {
  const OnlineUserList({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('build online user list');
    return StreamBuilder(
        stream: firestoreService.watchOtherIdleAndOnlineUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs
                  .map<Widget>((doc) => OnlineUserTile(user: doc.data() as OnlineUser))
                  .toList(),
            );
          } else {
            logger.w('There are currently no players online');
            return Container();
            // return Center(child: Text('There are currently no players online'));
          }
        });
  }
}
