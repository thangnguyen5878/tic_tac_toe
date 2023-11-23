import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/home/components/room_card.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print('build home screen...');
    return SafeArea(
      child: Scaffold(
        drawer: buildDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              padding: EdgeInsets.only(left: kPadding16),
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
            padding: const EdgeInsets.only(top: kPadding8, right: kPadding32),
            alignment: Alignment.center,
            child: Text('Tic-tac-toe', style: kTitle1),
          ),
          backgroundColor: kWhite,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: kPadding4),
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
                            padding: EdgeInsets.symmetric(horizontal: kPadding16, vertical: kPadding12),
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: kPadding12);
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
          child: Icon(Icons.add, size: kIconSize,),
          backgroundColor: kBrown40,
        ),
      ),
    );
  }

  // Hàm để tạo Drawer
  Widget buildDrawer() {
    return Drawer(
      backgroundColor: kWhite,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: kWhite),
            accountName: Text(
              'Not logged in',
              style: kBold,
            ),
            accountEmail: Text('Tap to open settings', style: kNormal,),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                radius: 16,
                backgroundColor: kGrey45,
                child: Icon(
                  Icons.person,
                  color: kWhite,
                ),
              ),
              onTap: () {

              },
            ),
          ),
          // ListTile(
          //   title: Text(
          //     'Header 1',
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
        ]
      ),
    );
  }
}