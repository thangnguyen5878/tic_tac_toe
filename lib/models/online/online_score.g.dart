// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineScore _$OnlineScoreFromJson(Map<String, dynamic> json) => OnlineScore()
  ..currentScore = json['currentScore'] as int
  ..initialScore = json['initialScore'] as int
  ..finalScore = json['finalScore'] as int?;

Map<String, dynamic> _$OnlineScoreToJson(OnlineScore instance) =>
    <String, dynamic>{
      'currentScore': instance.currentScore,
      'initialScore': instance.initialScore,
      'finalScore': instance.finalScore,
    };
