// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineHistory _$OnlineHistoryFromJson(Map<String, dynamic> json) =>
    OnlineHistory()
      ..currentRoundIndex = json['currentRoundIndex'] as int
      ..currentTurnIndex = json['currentTurnIndex'] as int
      ..currentPlayerIndex = json['currentPlayerIndex'] as int
      ..board = OnlineBoard.fromJson(json['board'] as Map<String, dynamic>);

Map<String, dynamic> _$OnlineHistoryToJson(OnlineHistory instance) =>
    <String, dynamic>{
      'currentRoundIndex': instance.currentRoundIndex,
      'currentTurnIndex': instance.currentTurnIndex,
      'currentPlayerIndex': instance.currentPlayerIndex,
      'board': instance.board.toJson(),
    };
