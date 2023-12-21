// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      ..turns = (json['turns'] as List<dynamic>)
          .map((e) =>
              e == null ? null : OnlineCell.fromJson(e as Map<String, dynamic>))
          .toList()
      ..historyTurns = (json['historyTurns'] as List<dynamic>)
          .map((e) =>
              e == null ? null : OnlineCell.fromJson(e as Map<String, dynamic>))
          .toList()
      ..historyTurnIndex = json['historyTurnIndex'] as int?;

Map<String, dynamic> _$OnlineRoundToJson(OnlineRound instance) =>
    <String, dynamic>{
      'index': instance.index,
      'players': instance.players?.map((e) => e.toJson()).toList(),
      'currentPlayerIndex': instance.currentPlayerIndex,
      'currentTurnIndex': instance.currentTurnIndex,
      'winnerIndex': instance.winnerIndex,
      'winTurnIndex': instance.winTurnIndex,
      'turns': instance.turns.map((e) => e?.toJson()).toList(),
      'historyTurns': instance.historyTurns.map((e) => e?.toJson()).toList(),
      'historyTurnIndex': instance.historyTurnIndex,
    };
