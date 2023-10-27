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
    r'currentTurnIndex': PropertySchema(
      id: 1,
      name: r'currentTurnIndex',
      type: IsarType.long,
    ),
    r'historyCurrentTurnIndex': PropertySchema(
      id: 2,
      name: r'historyCurrentTurnIndex',
      type: IsarType.long,
    ),
    r'number': PropertySchema(
      id: 3,
      name: r'number',
      type: IsarType.long,
    ),
    r'players': PropertySchema(
      id: 4,
      name: r'players',
      type: IsarType.objectList,
      target: r'Player',
    ),
    r'turns': PropertySchema(
      id: 5,
      name: r'turns',
      type: IsarType.objectList,
      target: r'Cell',
    ),
    r'winnerIndex': PropertySchema(
      id: 6,
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
  {
    final list = object.players;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Player]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += PlayerSchema.estimateSize(value, offsets, allOffsets);
        }
      }
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
  writer.writeLong(offsets[1], object.currentTurnIndex);
  writer.writeLong(offsets[2], object.historyCurrentTurnIndex);
  writer.writeLong(offsets[3], object.number);
  writer.writeObjectList<Player>(
    offsets[4],
    allOffsets,
    PlayerSchema.serialize,
    object.players,
  );
  writer.writeObjectList<Cell>(
    offsets[5],
    allOffsets,
    CellSchema.serialize,
    object.turns,
  );
  writer.writeLong(offsets[6], object.winnerIndex);
}

Round _roundDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Round(
    number: reader.readLongOrNull(offsets[3]),
    players: reader.readObjectList<Player>(
      offsets[4],
      PlayerSchema.deserialize,
      allOffsets,
      Player(),
    ),
    winnerIndex: reader.readLongOrNull(offsets[6]),
  );
  object.currentPlayerIndex = reader.readLongOrNull(offsets[0]);
  object.currentTurnIndex = reader.readLongOrNull(offsets[1]);
  object.historyCurrentTurnIndex = reader.readLongOrNull(offsets[2]);
  object.turns = reader.readObjectOrNullList<Cell>(
        offsets[5],
        CellSchema.deserialize,
        allOffsets,
      ) ??
      [];
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
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<Player>(
        offset,
        PlayerSchema.deserialize,
        allOffsets,
        Player(),
      )) as P;
    case 5:
      return (reader.readObjectOrNullList<Cell>(
            offset,
            CellSchema.deserialize,
            allOffsets,
          ) ??
          []) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RoundQueryFilter on QueryBuilder<Round, Round, QFilterCondition> {
  QueryBuilder<Round, Round, QAfterFilterCondition> currentPlayerIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentPlayerIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      currentPlayerIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentPlayerIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> currentPlayerIndexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPlayerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      currentPlayerIndexGreaterThan(
    int? value, {
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
    int? value, {
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
    int? lower,
    int? upper, {
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

  QueryBuilder<Round, Round, QAfterFilterCondition> currentTurnIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentTurnIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      currentTurnIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentTurnIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> currentTurnIndexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> currentTurnIndexGreaterThan(
    int? value, {
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

  QueryBuilder<Round, Round, QAfterFilterCondition> currentTurnIndexLessThan(
    int? value, {
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

  QueryBuilder<Round, Round, QAfterFilterCondition> currentTurnIndexBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyCurrentTurnIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'historyCurrentTurnIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyCurrentTurnIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'historyCurrentTurnIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyCurrentTurnIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyCurrentTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyCurrentTurnIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyCurrentTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyCurrentTurnIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyCurrentTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyCurrentTurnIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyCurrentTurnIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> numberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> numberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> numberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> numberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> numberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> numberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> playersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'players',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> playersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'players',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> playersLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'players',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> playersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'players',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> playersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'players',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> playersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'players',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> playersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'players',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> playersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'players',
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
  QueryBuilder<Round, Round, QAfterFilterCondition> playersElement(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'players');
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnsElement(
      FilterQuery<Cell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'turns');
    });
  }
}
