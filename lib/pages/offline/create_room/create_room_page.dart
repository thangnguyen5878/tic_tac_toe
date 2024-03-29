// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:get/get.dart';

import '../../../controllers/create_room_controller.dart';

class CreateRoomPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  CreateRoomPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
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
                  const SizedBox(height: 8),
                  buildRoomField(),
                  const SizedBox(height: 8),
                  buildPlayer1Field(),
                  const SizedBox(height: 8),
                  buildPlayer2Field(),
                  const SizedBox(height: 8),
                  buildRowCountField(),
                  const SizedBox(height: 8),
                  buildColumnCountField(),
                  const SizedBox(height: 8),
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
        backgroundColor: kBrown35,
        foregroundColor: kBlack,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
      ),
      child: const Text('Create Room'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          logger.t('press create room button');
          GameController.to.createRoom();
          // logger.t('Room Created: ${GameController.to.room.toShortString()}');
          CreateRoomController.to.clearInput();
          Get.toNamed(Routes.GAME);
        }
      },
    );
  }

  TextFormField buildRoomField() {
    return TextFormField(
      controller: CreateRoomController.to.room,
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
      controller: CreateRoomController.to.player1,
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
      controller: CreateRoomController.to.player2,
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
      controller: CreateRoomController.to.rowCount,
      decoration:
          kTextField(labelText: 'Number of rows ($rowCountFieldMinLength-$rowCountFieldMaxLength)'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        int? rowsValue = int.tryParse(value);
        if (rowsValue == null ||
            rowsValue < rowCountFieldMinLength ||
            rowsValue > rowCountFieldMaxLength) {
          return 'The board must has nummber of rows from $rowCountFieldMinLength to $rowCountFieldMaxLength';
        }
        return null;
      },
    );
  }

  TextFormField buildColumnCountField() {
    return TextFormField(
      controller: CreateRoomController.to.columnCount,
      decoration: kTextField(
        labelText: 'Number of columns ($columnCountFieldMinLength-$columnCountFieldMaxLength)',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
        int? columnsValue = int.tryParse(value);
        if (columnsValue == null ||
            columnsValue < columnCountFieldMinLength ||
            columnsValue > columnCountFieldMaxLength) {
          return 'The board must has number of columns from $columnCountFieldMinLength to $columnCountFieldMaxLength';
        }
        return null;
      },
    );
  }
}
