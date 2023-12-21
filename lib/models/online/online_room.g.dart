// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineRoom _$OnlineRoomFromJson(Map<String, dynamic> json) => OnlineRoom()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..state = $enumDecode(_$GameStateEnumMap, json['state'])
  ..board = OnlineBoard.fromJson(json['board'] as Map<String, dynamic>)
  ..historyBoard =
      OnlineBoard.fromJson(json['historyBoard'] as Map<String, dynamic>)
  ..rounds = (json['rounds'] as List<dynamic>?)
      ?.map((e) =>
          e == null ? null : OnlineRound.fromJson(e as Map<String, dynamic>))
      .toList()
  ..currentRoundIndex = json['currentRoundIndex'] as int
  ..historyRoundIndex = json['historyRoundIndex'] as int
  ..checkingCells = (json['checkingCells'] as List<dynamic>?)
      ?.map((e) => OnlineCell.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$OnlineRoomToJson(OnlineRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': _$GameStateEnumMap[instance.state]!,
      'board': instance.board.toJson(),
      'historyBoard': instance.historyBoard.toJson(),
      'rounds': instance.rounds?.map((e) => e?.toJson()).toList(),
      'currentRoundIndex': instance.currentRoundIndex,
      'historyRoundIndex': instance.historyRoundIndex,
      'checkingCells': instance.checkingCells?.map((e) => e.toJson()).toList(),
    };

const _$GameStateEnumMap = {
  GameState.playing: 'playing',
  GameState.stop: 'stop',
};
