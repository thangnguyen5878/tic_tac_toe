// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlinePlayer _$OnlinePlayerFromJson(Map<String, dynamic> json) => OnlinePlayer(
      index: json['index'] as int?,
      name: json['name'] as String?,
      seed: $enumDecodeNullable(_$SeedEnumMap, json['seed']),
    );

Map<String, dynamic> _$OnlinePlayerToJson(OnlinePlayer instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'seed': _$SeedEnumMap[instance.seed],
    };

const _$SeedEnumMap = {
  Seed.cross: 'cross',
  Seed.nought: 'nought',
  Seed.noSeed: 'noSeed',
};
