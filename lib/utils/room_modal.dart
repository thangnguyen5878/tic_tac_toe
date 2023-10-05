import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tic_tac_toe/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

void showRoomModal(BuildContext context) {
  final controller = Get.find<HomeController>();
  final _formKey = GlobalKey<FormState>();
  String roomName = '';
  String player1Name = '';
  String player2Name = '';
  int rows = 5;
  int columns = 5;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -40,
            top: -40,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.close),
              ),
            ),
          ),
          
        ],
      ),
    ),
  );
}


