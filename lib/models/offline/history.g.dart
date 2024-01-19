// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HistorySchema = Schema(
  name: r'History',
  id: 1676981785059398080,
  properties: {
    r'board': PropertySchema(
      id: 0,
      name: r'board',
      type: IsarType.object,
      target: r'Board',
    ),
    r'currentPlayerIndex': PropertySchema(
      id: 1,
      name: r'currentPlayerIndex',
      type: IsarType.long,
    ),
    r'currentRoundIndex': PropertySchema(
      id: 2,
      name: r'currentRoundIndex',
      type: IsarType.long,
    ),
    r'currentTurnIndex': PropertySchema(
      id: 3,
      name: r'currentTurnIndex',
      type: IsarType.long,
    )
  },
  estimateSize: _historyEstimateSize,
  serialize: _historySerialize,
  deserialize: _historyDeserialize,
  deserializeProp: _historyDeserializeProp,
);

int _historyEstimateSize(
  History object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      BoardSchema.estimateSize(object.board, allOffsets[Board]!, allOffsets);
  return bytesCount;
}

void _historySerialize(
  History object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Board>(
    offsets[0],
    allOffsets,
    BoardSchema.serialize,
    object.board,
  );
  writer.writeLong(offsets[1], object.currentPlayerIndex);
  writer.writeLong(offsets[2], object.currentRoundIndex);
  writer.writeLong(offsets[3], object.currentTurnIndex);
}

History _historyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = History();
  object.board = reader.readObjectOrNull<Board>(
        offsets[0],
        BoardSchema.deserialize,
        allOffsets,
      ) ??
      Board();
  object.currentPlayerIndex = reader.readLong(offsets[1]);
  object.currentRoundIndex = reader.readLong(offsets[2]);
  object.currentTurnIndex = reader.readLong(offsets[3]);
  return object;
}

P _historyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Board>(
            offset,
            BoardSchema.deserialize,
            allOffsets,
          ) ??
          Board()) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension HistoryQueryFilter
    on QueryBuilder<History, History, QFilterCondition> {
  QueryBuilder<History, History, QAfterFilterCondition>
      currentPlayerIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPlayerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      currentPlayerIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPlayerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      currentPlayerIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPlayerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      currentPlayerIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPlayerIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      currentRoundIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentRoundIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      currentRoundIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentRoundIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      currentRoundIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentRoundIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      currentRoundIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentRoundIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> currentTurnIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      currentTurnIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      currentTurnIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> currentTurnIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentTurnIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HistoryQueryObject
    on QueryBuilder<History, History, QFilterCondition> {
  QueryBuilder<History, History, QAfterFilterCondition> board(
      FilterQuery<Board> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'board');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History()
  ..currentRoundIndex = json['currentRoundIndex'] as int
  ..currentTurnIndex = json['currentTurnIndex'] as int
  ..currentPlayerIndex = json['currentPlayerIndex'] as int
  ..board = Board.fromJson(json['board'] as Map<String, dynamic>);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'currentRoundIndex': instance.currentRoundIndex,
      'currentTurnIndex': instance.currentTurnIndex,
      'currentPlayerIndex': instance.currentPlayerIndex,
      'board': instance.board.toJson(),
    };
