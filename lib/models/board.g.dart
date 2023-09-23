// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) => Board(
      rows: json['rows'] as int?,
      columns: json['columns'] as int?,
    )..cells = (json['cells'] as List<dynamic>)
        .map((e) => (e as List<dynamic>)
            .map((e) => Cell.fromJson(e as Map<String, dynamic>))
            .toList())
        .toList();

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'cells':
          instance.cells.map((e) => e.map((e) => e.toJson()).toList()).toList(),
      'rows': instance.rows,
      'columns': instance.columns,
    };
