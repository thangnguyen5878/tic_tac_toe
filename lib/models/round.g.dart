// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Round _$RoundFromJson(Map<String, dynamic> json) => Round(
      json['number'] as int,
    )
      ..turnCount = json['turnCount'] as int
      ..winner = json['winner'] == null
          ? null
          : Player.fromJson(json['winner'] as Map<String, dynamic>);

Map<String, dynamic> _$RoundToJson(Round instance) => <String, dynamic>{
      'number': instance.number,
      'turnCount': instance.turnCount,
      'winner': instance.winner?.toJson(),
    };
