import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/cell_widget.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/seed.dart';
import 'package:get/get.dart';

class GameView extends StatelessWidget {
  final roomId = Get.arguments;
  final GameController game = Get.find<GameController>();

  GameView({super.key});
  @override
  Widget build(BuildContext context) {
    print('build game page...');

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        game.saveRoom();
        Get.toNamed(Routes.HOME);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: GetBuilder<GameController>(
            builder: (game) {
              return Text(
                'Round: ${game.room.roundCount}, Turn: ${game.room.currentRound.turnCount}',
                style: const TextStyle(fontSize: 18),
              );
            },
          ),
          leading: buildBackButton(),
          actions: [
            // buildResetBoardButton(),
            buildNextRoundButton(),
            buildPopupMenuButton(),
          ],
        ),
        body: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 10),
                  buildBoard(context),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          buildPlayersBottomBar(),
        ]),
      ),
    );
  }

  IconButton buildBackButton() {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
        game.saveRoom();
        Get.toNamed(Routes.HOME);
        // FocusScope.of(context).unfocus();
      },
    );
  }

  buildPopupMenuButton() {
    return PopupMenuButton<String>(
      // offset: Offset(0, 57),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'reset',
          child: Text('Reset'),
        ),
        PopupMenuItem<String>(
          value: 'history',
          child: Text('History'),
        ),
      ],
      onSelected: (String value) {
        if (value == 'reset') {
          game.resetBoard();
        } else if (value == 'history') {
          Get.toNamed(Routes.HISTORY, arguments: roomId);
        }
      },
    );
  }

  GetBuilder<GameController> buildResetBoardButton() {
    return GetBuilder<GameController>(
      builder: (game) {
        // final isGameOver = game.room.state == GameState.stop;
        return IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            game.resetBoard();
          },
        );
      },
    );
  }

  GetBuilder<GameController> buildNextRoundButton() {
    return GetBuilder<GameController>(
      builder: (game) {
        final isGameOver = game.room.state == GameState.stop;
        if (isGameOver) {
          return IconButton(
            icon: const Icon(Icons.forward),
            onPressed: () {
              game.nextRound();
            },
          );
        }
        return Container();
      },
    );
  }

  Positioned buildPlayersBottomBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.grey,
        height: 50,
        child: GetBuilder(builder: (GameController game) {
          final currentPlayer = game.room.currentPlayer;
          final player1 = game.room.players[0];
          final player2 = game.room.players[1];

          final xColor = currentPlayer.seed == Seed.cross
              ? Colors.black
              : const Color.fromARGB(200, 100, 100, 100);
          final oColor = currentPlayer.seed == Seed.nought
              ? Colors.black
              : const Color.fromARGB(200, 100, 100, 100);
          final xBoxColor = currentPlayer.seed == Seed.cross
              ? const Color.fromARGB(211, 193, 100, 100)
              : Colors.grey;
          final oBoxColor = currentPlayer.seed == Seed.nought
              ? const Color.fromARGB(211, 193, 100, 100)
              : Colors.grey;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Player 1 Box
              Expanded(
                child: Container(
                  color: xBoxColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${player1.name}: X',
                        style: TextStyle(
                            color: xColor, fontWeight: FontWeight.bold),
                      ),
                      Text('Score: ${player1.score}',
                          style: TextStyle(
                              color: xColor, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              // Player 2 Box
              Expanded(
                child: Container(
                  color: oBoxColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${player2.name}: O',
                        style: TextStyle(
                            color: oColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Score: ${player2.score}',
                        style: TextStyle(
                            color: oColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

Widget buildBoard(BuildContext context) {
  print('build board...');
  final columnCount = GameController.to.room.board.columnCount;
  final rowCount = GameController.to.room.board.rowCount;
  print('columnCount: $columnCount');
  print('rowCount: $rowCount');

  return Container(
    decoration: BoxDecoration(border: Border.all(width: 1)),
    child: GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount!,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 1,
      ),
      itemCount: columnCount * rowCount!,
      itemBuilder: (context, index) {
        return CellWidget(
          row: index ~/ columnCount,
          column: index % columnCount,
        );
      },
    ),
  );
}
