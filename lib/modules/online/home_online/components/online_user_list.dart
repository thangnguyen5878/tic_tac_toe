import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/online/online_user.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/online_user_tile.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class OnlineUserList extends StatelessWidget {
  const OnlineUserList({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('build online user list');
    return StreamBuilder(
        stream: firestoreService.watchIdleUsers(),
        builder: (context, snapshot) {

          // error
          if (snapshot.hasError) {
            logger.e('ERROR: ${snapshot.error}');
            return Text('ERROR: ${snapshot.error}');
          }
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            logger.w('loading online user list');
            return Text('loading');
          }
          // load info
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => OnlineUserTile(user: doc.data() as OnlineUser))
                .toList(),
          );
        });
  }
}

