// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineCell _$OnlineCellFromJson(Map<String, dynamic> json) => OnlineCell(
      row: json['row'] as int?,
      column: json['column'] as int?,
      content: $enumDecodeNullable(_$SeedEnumMap, json['content']),
      state: $enumDecodeNullable(_$CellStateEnumMap, json['state']),
    );

Map<String, dynamic> _$OnlineCellToJson(OnlineCell instance) =>
    <String, dynamic>{
      'row': instance.row,
      'column': instance.column,
      'content': _$SeedEnumMap[instance.content],
      'state': _$CellStateEnumMap[instance.state],
    };

const _$SeedEnumMap = {
  Seed.cross: 'cross',
  Seed.nought: 'nought',
  Seed.noSeed: 'noSeed',
};

const _$CellStateEnumMap = {
  CellState.normal: 'normal',
  CellState.crossWin: 'crossWin',
  CellState.noughtWin: 'noughtWin',
};
