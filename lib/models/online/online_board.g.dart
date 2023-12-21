// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineBoard _$OnlineBoardFromJson(Map<String, dynamic> json) => OnlineBoard(
      rowCount: json['rowCount'] as int?,
      columnCount: json['columnCount'] as int?,
    )..cells = (json['cells'] as List<dynamic>)
        .map((e) => (e as List<dynamic>)
            .map((e) => OnlineCell.fromJson(e as Map<String, dynamic>))
            .toList())
        .toList();

Map<String, dynamic> _$OnlineBoardToJson(OnlineBoard instance) =>
    <String, dynamic>{
      'rowCount': instance.rowCount,
      'columnCount': instance.columnCount,
      'cells':
          instance.cells.map((e) => e.map((e) => e.toJson()).toList()).toList(),
    };
