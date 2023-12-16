import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/app_drawer.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_card.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('build home screen...');
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              padding: EdgeInsets.only(left: 16),
              icon: Icon(
                Icons.menu,
                color: kBlack,
                size: kIconSize,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: Container(
            padding: const EdgeInsets.only(top: 8, right: 32),
            alignment: Alignment.center,
            child: Text('Tic-tac-toe', style: kTitle1),
          ),
          backgroundColor: kWhite,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: 4),
              GetBuilder<GameController>(
                builder: (gameController) {
                  return FutureBuilder<List<Room>>(
                    future: GameController.to.isarService.getAllRooms(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Đã xảy ra lỗi'),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text('Không có phòng nào'),
                        );
                      } else if (snapshot.hasData) {
                        final rooms = snapshot.data!;
                        return Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 12);
                            },
                            itemCount: rooms.length,
                            itemBuilder: (context, index) {
                              final room = rooms[index];
                              return RoomCard(room);
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.CREATE_ROOM);
          },
          child: Icon(
            Icons.add,
            size: kIconSize,
          ),
          backgroundColor: kBrown40,
        ),
      ),
    );
  }
}
