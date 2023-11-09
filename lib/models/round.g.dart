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
    r'currentPLayer': PropertySchema(
      id: 0,
      name: r'currentPLayer',
      type: IsarType.object,
      target: r'Player',
    ),
    r'currentPlayerIndex': PropertySchema(
      id: 1,
      name: r'currentPlayerIndex',
      type: IsarType.long,
    ),
    r'currentTurn': PropertySchema(
      id: 2,
      name: r'currentTurn',
      type: IsarType.object,
      target: r'Cell',
    ),
    r'currentTurnIndex': PropertySchema(
      id: 3,
      name: r'currentTurnIndex',
      type: IsarType.long,
    ),
    r'historyPlayer': PropertySchema(
      id: 4,
      name: r'historyPlayer',
      type: IsarType.object,
      target: r'Player',
    ),
    r'historyPlayer1Score': PropertySchema(
      id: 5,
      name: r'historyPlayer1Score',
      type: IsarType.long,
    ),
    r'historyPlayer2Score': PropertySchema(
      id: 6,
      name: r'historyPlayer2Score',
      type: IsarType.long,
    ),
    r'historyPlayerIndex': PropertySchema(
      id: 7,
      name: r'historyPlayerIndex',
      type: IsarType.long,
    ),
    r'historyTurn': PropertySchema(
      id: 8,
      name: r'historyTurn',
      type: IsarType.object,
      target: r'Cell',
    ),
    r'historyTurnCount': PropertySchema(
      id: 9,
      name: r'historyTurnCount',
      type: IsarType.long,
    ),
    r'historyTurnIndex': PropertySchema(
      id: 10,
      name: r'historyTurnIndex',
      type: IsarType.long,
    ),
    r'historyTurns': PropertySchema(
      id: 11,
      name: r'historyTurns',
      type: IsarType.objectList,
      target: r'Cell',
    ),
    r'isHistoryWinTurn': PropertySchema(
      id: 12,
      name: r'isHistoryWinTurn',
      type: IsarType.bool,
    ),
    r'number': PropertySchema(
      id: 13,
      name: r'number',
      type: IsarType.long,
    ),
    r'player1': PropertySchema(
      id: 14,
      name: r'player1',
      type: IsarType.object,
      target: r'Player',
    ),
    r'player2': PropertySchema(
      id: 15,
      name: r'player2',
      type: IsarType.object,
      target: r'Player',
    ),
    r'players': PropertySchema(
      id: 16,
      name: r'players',
      type: IsarType.objectList,
      target: r'Player',
    ),
    r'turnCount': PropertySchema(
      id: 17,
      name: r'turnCount',
      type: IsarType.long,
    ),
    r'turns': PropertySchema(
      id: 18,
      name: r'turns',
      type: IsarType.objectList,
      target: r'Cell',
    ),
    r'winTurn': PropertySchema(
      id: 19,
      name: r'winTurn',
      type: IsarType.object,
      target: r'Cell',
    ),
    r'winTurnIndex': PropertySchema(
      id: 20,
      name: r'winTurnIndex',
      type: IsarType.long,
    ),
    r'winner': PropertySchema(
      id: 21,
      name: r'winner',
      type: IsarType.object,
      target: r'Player',
    ),
    r'winnerIndex': PropertySchema(
      id: 22,
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
  bytesCount += 3 +
      PlayerSchema.estimateSize(
          object.currentPLayer, allOffsets[Player]!, allOffsets);
  bytesCount += 3 +
      CellSchema.estimateSize(
          object.currentTurn, allOffsets[Cell]!, allOffsets);
  bytesCount += 3 +
      PlayerSchema.estimateSize(
          object.historyPlayer, allOffsets[Player]!, allOffsets);
  bytesCount += 3 +
      CellSchema.estimateSize(
          object.historyTurn, allOffsets[Cell]!, allOffsets);
  bytesCount += 3 + object.historyTurns.length * 3;
  {
    final offsets = allOffsets[Cell]!;
    for (var i = 0; i < object.historyTurns.length; i++) {
      final value = object.historyTurns[i];
      if (value != null) {
        bytesCount += CellSchema.estimateSize(value, offsets, allOffsets);
      }
    }
  }
  bytesCount += 3 +
      PlayerSchema.estimateSize(
          object.player1, allOffsets[Player]!, allOffsets);
  bytesCount += 3 +
      PlayerSchema.estimateSize(
          object.player2, allOffsets[Player]!, allOffsets);
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
  bytesCount += 3 +
      CellSchema.estimateSize(object.winTurn, allOffsets[Cell]!, allOffsets);
  bytesCount += 3 +
      PlayerSchema.estimateSize(object.winner, allOffsets[Player]!, allOffsets);
  return bytesCount;
}

void _roundSerialize(
  Round object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Player>(
    offsets[0],
    allOffsets,
    PlayerSchema.serialize,
    object.currentPLayer,
  );
  writer.writeLong(offsets[1], object.currentPlayerIndex);
  writer.writeObject<Cell>(
    offsets[2],
    allOffsets,
    CellSchema.serialize,
    object.currentTurn,
  );
  writer.writeLong(offsets[3], object.currentTurnIndex);
  writer.writeObject<Player>(
    offsets[4],
    allOffsets,
    PlayerSchema.serialize,
    object.historyPlayer,
  );
  writer.writeLong(offsets[5], object.historyPlayer1Score);
  writer.writeLong(offsets[6], object.historyPlayer2Score);
  writer.writeLong(offsets[7], object.historyPlayerIndex);
  writer.writeObject<Cell>(
    offsets[8],
    allOffsets,
    CellSchema.serialize,
    object.historyTurn,
  );
  writer.writeLong(offsets[9], object.historyTurnCount);
  writer.writeLong(offsets[10], object.historyTurnIndex);
  writer.writeObjectList<Cell>(
    offsets[11],
    allOffsets,
    CellSchema.serialize,
    object.historyTurns,
  );
  writer.writeBool(offsets[12], object.isHistoryWinTurn);
  writer.writeLong(offsets[13], object.number);
  writer.writeObject<Player>(
    offsets[14],
    allOffsets,
    PlayerSchema.serialize,
    object.player1,
  );
  writer.writeObject<Player>(
    offsets[15],
    allOffsets,
    PlayerSchema.serialize,
    object.player2,
  );
  writer.writeObjectList<Player>(
    offsets[16],
    allOffsets,
    PlayerSchema.serialize,
    object.players,
  );
  writer.writeLong(offsets[17], object.turnCount);
  writer.writeObjectList<Cell>(
    offsets[18],
    allOffsets,
    CellSchema.serialize,
    object.turns,
  );
  writer.writeObject<Cell>(
    offsets[19],
    allOffsets,
    CellSchema.serialize,
    object.winTurn,
  );
  writer.writeLong(offsets[20], object.winTurnIndex);
  writer.writeObject<Player>(
    offsets[21],
    allOffsets,
    PlayerSchema.serialize,
    object.winner,
  );
  writer.writeLong(offsets[22], object.winnerIndex);
}

Round _roundDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Round(
    number: reader.readLongOrNull(offsets[13]),
    winnerIndex: reader.readLongOrNull(offsets[22]),
  );
  object.currentPlayerIndex = reader.readLongOrNull(offsets[1]);
  object.currentTurnIndex = reader.readLongOrNull(offsets[3]);
  object.historyTurns = reader.readObjectOrNullList<Cell>(
        offsets[11],
        CellSchema.deserialize,
        allOffsets,
      ) ??
      [];
  object.players = reader.readObjectList<Player>(
    offsets[16],
    PlayerSchema.deserialize,
    allOffsets,
    Player(),
  );
  object.turns = reader.readObjectOrNullList<Cell>(
        offsets[18],
        CellSchema.deserialize,
        allOffsets,
      ) ??
      [];
  object.winTurnIndex = reader.readLongOrNull(offsets[20]);
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
      return (reader.readObjectOrNull<Player>(
            offset,
            PlayerSchema.deserialize,
            allOffsets,
          ) ??
          Player()) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<Cell>(
            offset,
            CellSchema.deserialize,
            allOffsets,
          ) ??
          Cell()) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<Player>(
            offset,
            PlayerSchema.deserialize,
            allOffsets,
          ) ??
          Player()) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readObjectOrNull<Cell>(
            offset,
            CellSchema.deserialize,
            allOffsets,
          ) ??
          Cell()) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readObjectOrNullList<Cell>(
            offset,
            CellSchema.deserialize,
            allOffsets,
          ) ??
          []) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readObjectOrNull<Player>(
            offset,
            PlayerSchema.deserialize,
            allOffsets,
          ) ??
          Player()) as P;
    case 15:
      return (reader.readObjectOrNull<Player>(
            offset,
            PlayerSchema.deserialize,
            allOffsets,
          ) ??
          Player()) as P;
    case 16:
      return (reader.readObjectList<Player>(
        offset,
        PlayerSchema.deserialize,
        allOffsets,
        Player(),
      )) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readObjectOrNullList<Cell>(
            offset,
            CellSchema.deserialize,
            allOffsets,
          ) ??
          []) as P;
    case 19:
      return (reader.readObjectOrNull<Cell>(
            offset,
            CellSchema.deserialize,
            allOffsets,
          ) ??
          Cell()) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readObjectOrNull<Player>(
            offset,
            PlayerSchema.deserialize,
            allOffsets,
          ) ??
          Player()) as P;
    case 22:
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

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayer1ScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyPlayer1Score',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyPlayer1ScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyPlayer1Score',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayer1ScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyPlayer1Score',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayer1ScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyPlayer1Score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayer2ScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyPlayer2Score',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyPlayer2ScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyPlayer2Score',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayer2ScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyPlayer2Score',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayer2ScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyPlayer2Score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayerIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyPlayerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyPlayerIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyPlayerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayerIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyPlayerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayerIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyPlayerIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyTurnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyTurnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyTurnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyTurnCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyTurnIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyTurnsElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'historyTurns',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyTurnsElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'historyTurns',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyTurns',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyTurns',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyTurns',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyTurns',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition>
      historyTurnsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyTurns',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyTurns',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> isHistoryWinTurnEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHistoryWinTurn',
        value: value,
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

  QueryBuilder<Round, Round, QAfterFilterCondition> turnCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'turnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'turnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'turnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> turnCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'turnCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
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

  QueryBuilder<Round, Round, QAfterFilterCondition> winTurnIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'winTurnIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winTurnIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'winTurnIndex',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winTurnIndexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winTurnIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winTurnIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winTurnIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winTurnIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winTurnIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
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
  QueryBuilder<Round, Round, QAfterFilterCondition> currentPLayer(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'currentPLayer');
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> currentTurn(
      FilterQuery<Cell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'currentTurn');
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyPlayer(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'historyPlayer');
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurn(
      FilterQuery<Cell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'historyTurn');
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> historyTurnsElement(
      FilterQuery<Cell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'historyTurns');
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> player1(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'player1');
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> player2(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'player2');
    });
  }

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

  QueryBuilder<Round, Round, QAfterFilterCondition> winTurn(
      FilterQuery<Cell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'winTurn');
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winner(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'winner');
    });
  }
}
