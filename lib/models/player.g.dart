// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      json['name'] as String,
      $enumDecode(_$SeedEnumMap, json['seed']),
    )..score = json['score'] as int;

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'seed': _$SeedEnumMap[instance.seed]!,
      'score': instance.score,
    };

const _$SeedEnumMap = {
  Seed.cross: 'cross',
  Seed.nought: 'nought',
  Seed.noSeed: 'noSeed',
};
