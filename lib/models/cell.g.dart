// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cell _$CellFromJson(Map<String, dynamic> json) => Cell(
      json['row'] as int,
      json['column'] as int,
    )
      ..content = $enumDecode(_$SeedEnumMap, json['content'])
      ..state = $enumDecode(_$CellStateEnumMap, json['state']);

Map<String, dynamic> _$CellToJson(Cell instance) => <String, dynamic>{
      'row': instance.row,
      'column': instance.column,
      'content': _$SeedEnumMap[instance.content]!,
      'state': _$CellStateEnumMap[instance.state]!,
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
