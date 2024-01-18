// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineRound _$OnlineRoundFromJson(Map<String, dynamic> json) => OnlineRound()
  ..index = json['index'] as int
  ..currentPlayerIndex = json['currentPlayerIndex'] as int
  ..winnerIndex = json['winnerIndex'] as int?
  ..turns = const OnlineCellListConverter()
      .fromJson(json['turns'] as List<Map<String, dynamic>>)
  ..scores = const OnlineScoreListConverter()
      .fromJson(json['scores'] as List<Map<String, dynamic>>);

Map<String, dynamic> _$OnlineRoundToJson(OnlineRound instance) =>
    <String, dynamic>{
      'index': instance.index,
      'currentPlayerIndex': instance.currentPlayerIndex,
      'winnerIndex': instance.winnerIndex,
      'turns': const OnlineCellListConverter().toJson(instance.turns),
      'scores': const OnlineScoreListConverter().toJson(instance.scores),
    };
