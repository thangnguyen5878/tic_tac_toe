// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BoardSchema = Schema(
  name: r'Board',
  id: -7147534215782858650,
  properties: {
    r'columnCount': PropertySchema(
      id: 0,
      name: r'columnCount',
      type: IsarType.long,
    ),
    r'rowCount': PropertySchema(
      id: 1,
      name: r'rowCount',
      type: IsarType.long,
    )
  },
  estimateSize: _boardEstimateSize,
  serialize: _boardSerialize,
  deserialize: _boardDeserialize,
  deserializeProp: _boardDeserializeProp,
);

int _boardEstimateSize(
  Board object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _boardSerialize(
  Board object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.columnCount);
  writer.writeLong(offsets[1], object.rowCount);
}

Board _boardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Board(
    columnCount: reader.readLongOrNull(offsets[0]),
    rowCount: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _boardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BoardQueryFilter on QueryBuilder<Board, Board, QFilterCondition> {
  QueryBuilder<Board, Board, QAfterFilterCondition> columnCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'columnCount',
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> columnCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'columnCount',
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> columnCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'columnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> columnCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'columnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> columnCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'columnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> columnCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'columnCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> rowCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rowCount',
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> rowCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rowCount',
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> rowCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rowCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> rowCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rowCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> rowCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rowCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Board, Board, QAfterFilterCondition> rowCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rowCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BoardQueryObject on QueryBuilder<Board, Board, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) => Board(
      rowCount: json['rowCount'] as int?,
      columnCount: json['columnCount'] as int?,
    )..cells = const CellListConverter2()
        .fromJson(json['cells'] as Map<String, dynamic>);

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'rowCount': instance.rowCount,
      'columnCount': instance.columnCount,
      'cells': const CellListConverter2().toJson(instance.cells),
    };
