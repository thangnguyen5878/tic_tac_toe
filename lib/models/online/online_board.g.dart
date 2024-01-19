// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineBoard _$OnlineBoardFromJson(Map<String, dynamic> json) => OnlineBoard(
      rowCount: json['rowCount'] as int?,
      columnCount: json['columnCount'] as int?,
    )..cells = const CellListConverter2()
        .fromJson(json['cells'] as Map<String, dynamic>);

Map<String, dynamic> _$OnlineBoardToJson(OnlineBoard instance) =>
    <String, dynamic>{
      'rowCount': instance.rowCount,
      'columnCount': instance.columnCount,
      'cells': const CellListConverter2().toJson(instance.cells),
    };
