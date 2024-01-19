// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineRoom _$OnlineRoomFromJson(Map<String, dynamic> json) => OnlineRoom(
      name: json['name'] as String?,
      state: $enumDecodeNullable(_$GameStateEnumMap, json['state']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastAccessAt: json['lastAccessAt'] == null
          ? null
          : DateTime.parse(json['lastAccessAt'] as String),
      board: json['board'] == null
          ? null
          : OnlineBoard.fromJson(json['board'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>?)
          ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      rounds: (json['rounds'] as List<dynamic>?)
          ?.map((e) => OnlineRound.fromJson(e as Map<String, dynamic>))
          .toList(),
      history: json['history'] == null
          ? null
          : OnlineHistory.fromJson(json['history'] as Map<String, dynamic>),
      playerIds: (json['playerIds'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )..id = json['id'] as String;

Map<String, dynamic> _$OnlineRoomToJson(OnlineRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastAccessAt': instance.lastAccessAt.toIso8601String(),
      'state': _$GameStateEnumMap[instance.state]!,
      'board': instance.board.toJson(),
      'players': instance.players.map((e) => e.toJson()).toList(),
      'playerIds': instance.playerIds,
      'rounds': instance.rounds.map((e) => e.toJson()).toList(),
      'history': instance.history.toJson(),
    };

const _$GameStateEnumMap = {
  GameState.playing: 'playing',
  GameState.stop: 'stop',
};
