// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
OnlineRoom _$OnlineRoomFromJson(Map<String, dynamic> json) => OnlineRoom()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..state = $enumDecode(_$GameStateEnumMap, json['state'])
  ..board = OnlineBoard.fromJson(json['board'] as Map<String, dynamic>)
  ..historyBoard = OnlineBoard.fromJson(json['historyBoard'] as Map<String, dynamic>)
  ..rounds = _$JsonConverterFromJson<List<Map<String, dynamic>>, List<OnlineRound?>>(
      json['rounds'], const OnlineRoundListConverter().fromJson)
  ..currentRoundIndex = json['currentRoundIndex'] as int
  ..historyRoundIndex = json['historyRoundIndex'] as int;

Map<String, dynamic> _$OnlineRoomToJson(OnlineRoom instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': _$GameStateEnumMap[instance.state]!,
      'board': instance.board.toJson(),
      'historyBoard': instance.historyBoard.toJson(),
      'rounds': _$JsonConverterToJson<List<Map<String, dynamic>>, List<OnlineRound?>>(
          instance.rounds, const OnlineRoundListConverter().toJson),
      'currentRoundIndex': instance.currentRoundIndex,
      'historyRoundIndex': instance.historyRoundIndex,
      'winCount': instance.winCount,
    };

const _$GameStateEnumMap = {
  GameState.playing: 'playing',
  GameState.stop: 'stop',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
