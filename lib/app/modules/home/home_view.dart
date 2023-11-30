import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/home/components/room_card.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_cache.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

import '../auth/auth_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print('build home screen...');
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: kPadding16, vertical: kPadding12),
                            separatorBuilder:
                                (BuildContext context, int index) {
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
          child: Icon(
            Icons.add,
            size: kIconSize,
          ),
          backgroundColor: kBrown40,
        ),
      ),
    );
  }

  Obx AppDrawer() {
    return Obx(() {
      return Drawer(
        backgroundColor: kWhite, // Đặt màu nền của Drawer là kWhite
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: kWhite,
              ),
              currentAccountPictureSize: Size.square(56),
              // avatar
              currentAccountPicture: GestureDetector(
                child: ClipOval(
                  child: CircleAvatar(
                    backgroundColor: kGrey45,
                    child: AuthController.to.user.value == null
                        ? Icon(
                            Icons.person,
                            color: kWhite,
                          )
                        : CachedNetworkImage(
                            imageUrl: AuthController.to.user.value!.photoURL!,
                            fit: BoxFit.fitHeight,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            cacheManager: appCacheManager,
                          ),
                  ),
                ),
                onTap: () {
                  Get.toNamed(Routes.AUTH);
                },
              ),
              // user name
              accountName: Text(
                AuthController.to.user.value == null
                    ? 'Not logged in'
                    : AuthController.to.user.value!.displayName!,
                style: kSmallBoldText,
              ),
              // user email
              accountEmail: Text(
                AuthController.to.user.value == null
                    ? 'Tap to open settings'
                    : AuthController.to.user.value!.email!,
                style: kSmallText,
              ),
            ),
          ],
        ),
      );
    });
  }
}
