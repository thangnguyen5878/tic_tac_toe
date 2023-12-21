// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
// import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
// import 'package:flutter_tic_tac_toe/models/online/online_round.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// class NestedOnlineCellListConverter extends JsonConverter<List<OnlineCell>, List<Map<String, dynamic>>> {
//   const NestedOnlineCellListConverter();
//
//   @override
//   List<Map<String, dynamic>> toJson(List<OnlineCell> cells) {
//     return cells.map((cell) {
//       final cellMap = cell.toJson();
//       cellMap['cellRef'] = FirebaseFirestore.instance.collection('rooms').doc('roomId').collection('cells').doc();
//       return cellMap;
//     }).toList();
//   }
//
//   @override
//   List<OnlineCell> fromJson(List<Map<String, dynamic>> jsonCells) {
//     return jsonCells.map((jsonCell) {
//       final cell = OnlineCell.fromJson(jsonCell);
//       cell.cellRef = jsonCell['cellRef'] as DocumentReference<Map<String, dynamic>>;
//       return cell;
//     }).toList();
//   }
// }
//
// class NestedOnlineRoundListConverter extends JsonConverter<List<OnlineRound>, List<Map<String, dynamic>>> {
//   const NestedOnlineRoundListConverter();
//
//   @override
//   List<Map<String, dynamic>> toJson(List<OnlineRound> rounds) {
//     // Convert each round to a map and add a reference to the nested collection
//     return rounds.map((round) {
//       final roundMap = round.toJson();
//       roundMap['roundsRef'] = FirebaseFirestore.instance.collection('rooms').doc('roomId').collection('rounds');
//       return roundMap;
//     }).toList();
//   }
//
//   @override
//   List<OnlineRound> fromJson(List<Map<String, dynamic>> jsonRounds) {
//     // Extract the round data and create DocumentReferences for the nested collection
//     return jsonRounds.map((jsonRound) {
//       final round = OnlineRound.fromJson(jsonRound);
//       round.roundsRef = FirebaseFirestore.instance.collection('rooms').doc('roomId').collection('rounds');
//       return round;
//     }).toList();
//   }
// }
//
// class NestedOnlinePlayerListConverter extends JsonConverter<List<OnlinePlayer>, List<Map<String, dynamic>>> {
//   const NestedOnlinePlayerListConverter();
//
//   @override
//   List<Map<String, dynamic>> toJson(List<OnlinePlayer> players) {
//     return players.map((player) {
//       final playerMap = player.toJson();
//       playerMap['playerRef'] = FirebaseFirestore.instance.collection('rooms').doc('roomId').collection('players').doc(); // Assuming a nested collection named 'players'
//       return playerMap;
//     }).toList();
//   }
//
//   @override
//   List<OnlinePlayer> fromJson(List<Map<String, dynamic>> jsonPlayers) {
//     return jsonPlayers.map((jsonPlayer) {
//       final player = OnlinePlayer.fromJson(jsonPlayer);
//       player.playerRef = jsonPlayer['playerRef'] as DocumentReference<Map<String, dynamic>>;
//       return player;
//     }).toList();
//   }
// }
//
