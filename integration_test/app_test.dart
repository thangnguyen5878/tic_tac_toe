import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tic_tac_toe/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('full app test', (tester) async {
    app.main();
    tester.pumpAndSettle();
    // TODO1: press add room button on home screen
    final addRoomButton = find.byType(FloatingActionButton).first;
    tester.tap(addRoomButton);

    // TODO2: enter text in the form and press the button to create room
    final roomFormField = find.byKey(const Key('room_input'));
    final player1FormField = find.byKey(const Key('player1_input'));
    final player2FormField = find.byKey(const Key('player2_input'));
    final rowFormField = find.byKey(const Key('row_input'));
    final columnFormField = find.byKey(const Key('column_input'));
    final createRoomButton = find.byKey(const Key('create_room_button'));

    tester.enterText(roomFormField, 'room 1');
    tester.enterText(player1FormField, 'John');
    tester.enterText(player2FormField, 'Kate');
    tester.enterText(rowFormField, '9');
    tester.enterText(columnFormField, '11');
    tester.pumpAndSettle();

    tester.tap(createRoomButton);
  });

}