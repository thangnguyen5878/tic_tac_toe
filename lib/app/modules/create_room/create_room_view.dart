// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_input.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';

import 'package:get/get.dart';

import 'create_room_controller.dart';

class CreateRoomView extends StatelessWidget {
  final createRoomController = Get.find<CreateRoomController>();
  final gameController = Get.find<GameController>();

  final _formKey = GlobalKey<FormState>();

  CreateRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
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
                  SizedBox(height: kPadding8),
                  buildRoomField(),
                  SizedBox(height: kPadding8),
                  buildPlayer1Field(),
                  SizedBox(height: kPadding8),
                  buildPlayer2Field(),
                  SizedBox(height: kPadding8),
                  buildRowCountField(),
                  SizedBox(height: kPadding8),
                  buildColumnCountField(),
                  SizedBox(height: kPadding8),
                  buildCreateRoomButton(),
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
      style: ElevatedButton.styleFrom(
        backgroundColor: kBrown30,
        foregroundColor: kBlack,
        padding:
            EdgeInsets.symmetric(horizontal: kPadding48, vertical: kPadding8),
      ),
      child: const Text('Create Room'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          print('press create room button');
          GameController.to.createRoom();
          print('Room Created: ${GameController.to.room}');
          createRoomController.clear();
          Get.toNamed(Routes.GAME);
        }
      },
    );
  }

  TextFormField buildRoomField() {
    return TextFormField(
      controller: createRoomController.room,
      decoration: kTextField(labelText: 'Room'),
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        if (value.length > roomFieldMaxLength) {
          return 'Room\'s name must be less than or equal to $roomFieldMaxLength characters';
        }
        return null;
      },
    );
  }

  TextFormField buildPlayer1Field() {
    return TextFormField(
      controller: createRoomController.player1,
      decoration: kTextField(labelText: 'Player 1'),
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        if (value.length > player1FieldMaxLength) {
          return 'Player 1\'s name must be less than or equal to $player1FieldMaxLength characters';
        }
        return null;
      },
    );
  }

  TextFormField buildPlayer2Field() {
    return TextFormField(
      controller: createRoomController.player2,
      decoration: kTextField(labelText: 'Player 2'),
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        if (value.length > player2FieldMaxLength) {
          return 'Player 2 name must be less than or equal to $player2FieldMaxLength characters';
        }
        return null;
      },
    );
  }

  TextFormField buildRowCountField() {
    return TextFormField(
      controller: createRoomController.rowCount,
      decoration: kTextField(
          labelText: 'Number of rows ($rowCountFieldMinLength-$rowCountFieldMaxLength)'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        int? rowsValue = int.tryParse(value);
        if (rowsValue == null || rowsValue < rowCountFieldMinLength || rowsValue > rowCountFieldMaxLength) {
          return 'The board must has nummber of rows from $rowCountFieldMinLength to $rowCountFieldMaxLength';
        }
        return null;
      },
    );
  }

  TextFormField buildColumnCountField() {
    return TextFormField(
      controller: createRoomController.columnCount,
      decoration: kTextField(
        labelText: 'Number of columns ($columnCountFieldMinLength-$columnCountFieldMaxLength)',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        int? columnsValue = int.tryParse(value);
        if (columnsValue == null || columnsValue < columnCountFieldMinLength || columnsValue > columnCountFieldMaxLength) {
          return 'The board must has number of columns from $columnCountFieldMinLength to $columnCountFieldMaxLength';
        }
        return null;
      },
    );
  }
}
