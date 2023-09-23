// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      player1: json['player1'] == null
          ? null
          : Player.fromJson(json['player1'] as Map<String, dynamic>),
      player2: json['player2'] == null
          ? null
          : Player.fromJson(json['player2'] as Map<String, dynamic>),
    )
      ..currentPlayer =
          Player.fromJson(json['currentPlayer'] as Map<String, dynamic>)
      ..board = Board.fromJson(json['board'] as Map<String, dynamic>)
      ..state = $enumDecode(_$GameStateEnumMap, json['state'])
      ..rounds = (json['rounds'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Round.fromJson(e as Map<String, dynamic>))
          .toList()
      ..roundCount = json['roundCount'] as int
      ..currentRound =
          Round.fromJson(json['currentRound'] as Map<String, dynamic>)
      ..checkingCells = (json['checkingCells'] as List<dynamic>?)
          ?.map((e) => Cell.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'player1': instance.player1.toJson(),
      'player2': instance.player2.toJson(),
      'currentPlayer': instance.currentPlayer.toJson(),
      'board': instance.board.toJson(),
      'state': _$GameStateEnumMap[instance.state]!,
      'rounds': instance.rounds?.map((e) => e?.toJson()).toList(),
      'roundCount': instance.roundCount,
      'currentRound': instance.currentRound.toJson(),
      'checkingCells': instance.checkingCells?.map((e) => e.toJson()).toList(),
    };

const _$GameStateEnumMap = {
  GameState.playing: 'playing',
  GameState.stop: 'stop',
};
