// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RoundSchema = Schema(
  name: r'Round',
  id: 8762410198825043196,
  properties: {
    r'currentPlayerIndex': PropertySchema(
      id: 0,
      name: r'currentPlayerIndex',
      type: IsarType.long,
    ),
    r'index': PropertySchema(
      id: 1,
      name: r'index',
      type: IsarType.long,
    ),
    r'scores': PropertySchema(
      id: 2,
      name: r'scores',
      type: IsarType.objectList,
      target: r'Score',
    ),
    r'turns': PropertySchema(
      id: 3,
      name: r'turns',
      type: IsarType.objectList,
      target: r'Cell',
    ),
    r'winnerIndex': PropertySchema(
      id: 4,
      name: r'winnerIndex',
      type: IsarType.long,
    )
  },
  estimateSize: _roundEstimateSize,
  serialize: _roundSerialize,
  deserialize: _roundDeserialize,
  deserializeProp: _roundDeserializeProp,
);

int _roundEstimateSize(
  Round object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.scores.length * 3;
  {
    final offsets = allOffsets[Score]!;
    for (var i = 0; i < object.scores.length; i++) {
      final value = object.scores[i];
      bytesCount += ScoreSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.turns.length * 3;
  {
    final offsets = allOffsets[Cell]!;
    for (var i = 0; i < object.turns.length; i++) {
      final value = object.turns[i];
      if (value != null) {
        bytesCount += CellSchema.estimateSize(value, offsets, allOffsets);
      }
    }
  }
  return bytesCount;
}

void _roundSerialize(
  Round object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentPlayerIndex);
  writer.writeLong(offsets[1], object.index);
  writer.writeObjectList<Score>(
    offsets[2],
    allOffsets,
    ScoreSchema.serialize,
    object.scores,
  );
  writer.writeObjectList<Cell>(
    offsets[3],
    allOffsets,
    CellSchema.serialize,
    object.turns,
  );
  writer.writeLong(offsets[4], object.winnerIndex);
}

Round _roundDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Round();
  object.currentPlayerIndex = reader.readLong(offsets[0]);
  object.index = reader.readLong(offsets[1]);
  object.scores = reader.readObjectList<Score>(
        offsets[2],
        ScoreSchema.deserialize,
        allOffsets,
        Score(),
      ) ??
      [];
  object.turns = reader.readObjectOrNullList<Cell>(
        offsets[3],
        CellSchema.deserialize,
        allOffsets,
      ) ??
      [];
  object.winnerIndex = reader.readLongOrNull(offsets[4]);
  return object;
}

P _roundDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readObjectList<Score>(
            offset,
            ScoreSchema.deserialize,
            allOffsets,
            Score(),
          ) ??
          []) as P;
    case 3:
      return (reader.readObjectOrNullList<Cell>(
            offset,
            CellSchema.deserialize,
            allOffsets,
          ) ??
          []) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RoundQueryFilter on QueryBuilder<Round, Round, QFilterCondition> {
  QueryBuilder<Round, Round, QAfterFilterCondition> currentPlayerIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPlayerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
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

  QueryBuilder<Round, Round, QAfterFilterCondition> currentPlayerIndexLessThan(
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

  QueryBuilder<Round, Round, QAfterFilterCondition> currentPlayerIndexBetween(
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

  QueryBuilder<Round, Round, QAfterFilterCondition> indexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> indexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> indexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> indexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoresLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scores',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scores',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scores',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scores',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scores',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scores',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'turns',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'turns',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'turns',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'turns',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'turns',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'turns',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'turns',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'turns',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'winnerIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'winnerIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerIndexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winnerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winnerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winnerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winnerIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RoundQueryObject on QueryBuilder<Round, Round, QFilterCondition> {
  QueryBuilder<Round, Round, QAfterFilterCondition> scoresElement(
      FilterQuery<Score> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'scores');
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsElement(
      FilterQuery<Cell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'turns');
    });
  }
}
