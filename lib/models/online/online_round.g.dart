// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
OnlineRound _$OnlineRoundFromJson(Map<String, dynamic> json) => OnlineRound(
      index: json['index'] as int?,
      winnerIndex: json['winnerIndex'] as int?,
      players: (json['players'] as List<dynamic>?)
          ?.map((e) => OnlinePlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..currentPlayerIndex = json['currentPlayerIndex'] as int?
      ..currentTurnIndex = json['currentTurnIndex'] as int?
      ..winTurnIndex = json['winTurnIndex'] as int?
      ..turns =
          const OnlineCellListConverter().fromJson(json['turns'] as List<Map<String, dynamic>>)
      ..historyTurns = const OnlineCellListConverter()
          .fromJson(json['historyTurns'] as List<Map<String, dynamic>>)
      .._historyPlayerIndex = json['_historyPlayerIndex'] as int?
      ..historyTurnIndex = json['historyTurnIndex'] as int?;

Map<String, dynamic> _$OnlineRoundToJson(OnlineRound instance) => <String, dynamic>{
      'index': instance.index,
      'players': instance.players?.map((e) => e.toJson()).toList(),
      'currentPlayerIndex': instance.currentPlayerIndex,
      'currentTurnIndex': instance.currentTurnIndex,
      'winnerIndex': instance.winnerIndex,
      'winTurnIndex': instance.winTurnIndex,
      'turns': const OnlineCellListConverter().toJson(instance.turns),
      'historyTurns': const OnlineCellListConverter().toJson(instance.historyTurns),
      '_historyPlayerIndex': instance._historyPlayerIndex,
      'historyTurnIndex': instance.historyTurnIndex,
    };
