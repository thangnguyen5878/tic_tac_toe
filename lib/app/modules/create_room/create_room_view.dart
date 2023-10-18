import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/home/home_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';

import 'package:get/get.dart';

import 'create_room_controller.dart';

class CreateRoomView extends StatelessWidget {
  final createRoomController = Get.find<CreateRoomController>();
  final gameController = Get.find<GameController>();
  final _formKey = GlobalKey<FormState>();

  String roomName = '';
  String player1Name = '';
  String player2Name = '';
  int rows = 5;
  int columns = 5;
  CreateRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create Room',
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _buildRoomField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _buildPlayer1Field(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _buildPlayer2Field(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _buildRowCountField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _buildColumnCountField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: buildCreateRoomButton(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildCreateRoomButton() {
    return ElevatedButton(
      child: const Text('Create Room'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          print('press create room button');
          gameController.createRoom();
          print('Room Created: ${gameController.room}');
          createRoomController.clear();
          Get.toNamed(Routes.GAME);
        }
      },
    );
  }

  TextFormField _buildRoomField() {
    return TextFormField(
      controller: createRoomController.room,
      decoration: kTextField(labelText: 'Room'),
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        if (value.length > 30) {
          return 'Room\'s name must be less than or equal to 30 characters';
        }
        return null;
      },
    );
  }

  TextFormField _buildPlayer1Field() {
    return TextFormField(
      controller: createRoomController.player1,
      decoration: kTextField(labelText: 'Player 1'),
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        if (value.length > 50) {
          return 'Player 1\'s name must be less than or equal to 50 characters';
        }
        return null;
      },
    );
  }

  TextFormField _buildPlayer2Field() {
    return TextFormField(
      controller: createRoomController.player2,
      decoration: kTextField(labelText: 'Player 2'),
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        if (value.length > 50) {
          return 'Player 2 name must be less than or equal to 50 characters';
        }
        return null;
      },
    );
  }

  TextFormField _buildRowCountField() {
    return TextFormField(
      controller: createRoomController.rowCount,
      decoration: kTextField(
          // hintText: 'Number of rows (5-18)',
          labelText: 'Number of rows (5-18)'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        int? rowsValue = int.tryParse(value);
        if (rowsValue == null || rowsValue < 5 || rowsValue > 18) {
          return 'The board must has nummber of rows from 5 to 18';
        }
        return null;
      },
    );
  }

  TextFormField _buildColumnCountField() {
    return TextFormField(
      controller: createRoomController.columnCount,
      decoration: kTextField(
        // hintText: 'Number of columns (5-12)',
        labelText: 'Number of columns (5-12)',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        int? columnsValue = int.tryParse(value);
        if (columnsValue == null || columnsValue < 5 || columnsValue > 12) {
          return 'The board must has number of columns from 5 to 12';
        }
        return null;
      },
    );
  }
}
