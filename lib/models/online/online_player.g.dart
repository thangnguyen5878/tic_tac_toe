// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlinePlayer _$OnlinePlayerFromJson(Map<String, dynamic> json) => OnlinePlayer(
      index: json['index'] as int?,
      name: json['name'] as String?,
      seed: $enumDecodeNullable(_$SeedEnumMap, json['seed']),
      score: json['score'] as int?,
    )
      ..initialScore = json['initialScore'] as int?
      ..finalScore = json['finalScore'] as int?;

Map<String, dynamic> _$OnlinePlayerToJson(OnlinePlayer instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'seed': _$SeedEnumMap[instance.seed],
      'score': instance.score,
      'initialScore': instance.initialScore,
      'finalScore': instance.finalScore,
    };

const _$SeedEnumMap = {
  Seed.cross: 'cross',
  Seed.nought: 'nought',
  Seed.noSeed: 'noSeed',
};
