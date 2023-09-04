import 'package:tic_tac_toe/utils/winner_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/views/winner_page.dart';

class TableController extends GetxController {
  static TableController get to => Get.find();

  var rows = 3;
  var columns = 3;
  int winCount = 5;
  var currentPlayer = 'Player1';
  var currentPlayerXO = 'X';
  var player1 = 'Player 1';
  var player2 = 'Player 2';
  var winner = '';
  bool isGameOver = false;

  var inputRowsController = TextEditingController();
  var inputColumnsController = TextEditingController();
  var inputPlayer1Controller = TextEditingController();
  var inputPlayer2Controller = TextEditingController();

  var listXO = [
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
  ]; // X,O List

  createListXO() {
    listXO = List.generate(
        rows, (index) => List.generate(columns, (index) => '', growable: true),
        growable: true);
    print('create empty xo list: $rows rows, $columns columns');
    update();
  }

  void setPlayer1(String name) {
    player1 = name;
    print('set player1: $name');
    update();
  }

  void setPlayer2(String name) {
    player2 = name;
    print('set player2: $name');
    update();
  }

  void setRows(int value) {
    rows = value;
    print('set rows: $value');
    update();
  }

  void setColumns(int value) {
    columns = value;
    print('set columns: $value');
    update();
  }

  void togglePlayer() {
    if (currentPlayerXO == 'X') {
      currentPlayerXO = 'O';
      currentPlayer = player2;
    } else {
      currentPlayerXO = 'X';
      currentPlayer = player1;
    }
    print('toogle player: $currentPlayer, $currentPlayerXO');
    update();
  }

  void resetPlayer() {
    currentPlayerXO = 'X';
    currentPlayer = '';
    player1 = 'Player 1';
    player2 = 'Player 2';
    isGameOver = false;
    print('reset player');
    print('Current player: $currentPlayer, $currentPlayerXO');
    print('Player 1: $player1');
    print('Player 2: $player2');
    update();
  }

  void emptyXOList() {
    for (int i = 0; i < rows; i++) {
      for (var j = 0; j < columns; j++) {
        listXO[i][j] = '';
      }
    }
    update();
    print('XO List is empty');
    print(listXO);
  }

  void drawXO(int row, int column) {
    // int row = index % rows.value;
    // int column = index ~/ rows.value;
    print('draw something...');
    if (isGameOver == false && currentPlayerXO == 'X' && listXO[row][column] == '') {
      listXO[row][column] = "X";
      print('draw X');
      print(listXO);
      checkWinner();
      togglePlayer();
    }
    if (isGameOver == false && currentPlayerXO != 'X' && listXO[row][column] == '') {
      listXO[row][column] = "O";
      print('draw O');
      print(listXO);
      checkWinner();
      togglePlayer();
    }
    update();
  }

  void checkWinner() {
    print('check winner...');
    // 3 symbbols in a row
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j <= columns - winCount; j++) {
        if (listXO[i][j] == listXO[i][j + 1] &&
            listXO[i][j] == listXO[i][j + 2] &&
            listXO[i][j] == listXO[i][j + 3] &&
            listXO[i][j] == listXO[i][j + 4] &&
            listXO[i][j] != '') {
          if (listXO[i][j] == 'X') {
            print('Winner is $winner');
            winner = player1;
            isGameOver = true;
            Get.toNamed('\winner');
            update();
          }
          if (listXO[i][j] == 'O') {
            print('Winner is $winner');
            winner = player2;
            isGameOver = true;
            Get.toNamed('\winner');
            update();
          }
        }
      }
    }
    // 3 symbols in a column
    for (int j = 0; j < columns; j++) {
      for (int i = 0; i <= rows - winCount; i++) {
        if (listXO[i][j] == listXO[i + 1][j] &&
            listXO[i][j] == listXO[i + 2][j] &&
            listXO[i][j] == listXO[i + 3][j] &&
            listXO[i][j] == listXO[i + 4][j] &&
            listXO[i][j] != '') {
          if (listXO[i][j] == 'X') {
            print('Winner is $winner');
            winner = player1;
            isGameOver = true;
            Get.toNamed('\winner');
            update();
          }
          if (listXO[i][j] == 'O') {
            print('Winner is $winner');
            winner = player2;
            isGameOver = true;
            Get.toNamed('\winner');
            update();
          }
        }
      }
    }
    // 3 symbols in a diagonal type: \
    for (int i = 0; i <= rows - winCount; i++) {
      for (int j = 0; j <= columns - winCount; j++) {
        if (listXO[i][j] == listXO[i + 1][j + 1] &&
            listXO[i][j] == listXO[i + 2][j + 2] &&
            listXO[i][j] == listXO[i + 3][j + 3] &&
            listXO[i][j] == listXO[i + 4][j + 4] &&
            listXO[i][j] != '') {
          if (listXO[i][j] == 'X') {
            print('Winner is $winner');
            winner = player1;
            isGameOver = true;
            Get.toNamed('\winner');
            update();
          }
          if (listXO[i][j] == 'O') {
            print('Winner is $winner');
            winner = player2;
            isGameOver = true;
            Get.toNamed('\winner');
            update();
          }
        }
      }
    }
    // 3 symbols in a diagonal type: /
    for (int i = 0; i <= rows - winCount; i++) {
      for (int j = winCount - 1; j < columns; j++) {
        if (listXO[i][j] == listXO[i + 1][j - 1] &&
            listXO[i][j] == listXO[i + 2][j - 2] &&
            listXO[i][j] == listXO[i + 3][j - 3] &&
            listXO[i][j] == listXO[i + 4][j - 4] &&
            listXO[i][j] != '') {
          if (listXO[i][j] == 'X') {
            print('Winner is $winner');
            winner = player1;
            isGameOver = true;
            Get.toNamed('\winner');
            update();
          }
          if (listXO[i][j] == 'O') {
            print('Winner is $winner');
            winner = player2;
            isGameOver = true;
            Get.toNamed('\winner');
            update();
          }
        }
      }
    }
  }

  clearInput() {
    inputRowsController.clear();
    inputColumnsController.clear();
    inputPlayer1Controller.clear();
    inputPlayer2Controller.clear();
  }
}
