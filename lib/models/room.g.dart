// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRoomCollection on Isar {
  IsarCollection<Room> get rooms => this.collection();
}

const RoomSchema = CollectionSchema(
  name: r'Room',
  id: -1093513927825131211,
  properties: {
    r'board': PropertySchema(
      id: 0,
      name: r'board',
      type: IsarType.object,
      target: r'Board',
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'history': PropertySchema(
      id: 2,
      name: r'history',
      type: IsarType.object,
      target: r'History',
    ),
    r'lastAccessAt': PropertySchema(
      id: 3,
      name: r'lastAccessAt',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'playerIds': PropertySchema(
      id: 5,
      name: r'playerIds',
      type: IsarType.stringList,
    ),
    r'players': PropertySchema(
      id: 6,
      name: r'players',
      type: IsarType.objectList,
      target: r'Player',
    ),
    r'rounds': PropertySchema(
      id: 7,
      name: r'rounds',
      type: IsarType.objectList,
      target: r'Round',
    ),
    r'state': PropertySchema(
      id: 8,
      name: r'state',
      type: IsarType.string,
      enumMap: _RoomstateEnumValueMap,
    ),
    r'winCount': PropertySchema(
      id: 9,
      name: r'winCount',
      type: IsarType.long,
    )
  },
  estimateSize: _roomEstimateSize,
  serialize: _roomSerialize,
  deserialize: _roomDeserialize,
  deserializeProp: _roomDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Board': BoardSchema,
    r'Player': PlayerSchema,
    r'Round': RoundSchema,
    r'Cell': CellSchema,
    r'Score': ScoreSchema,
    r'History': HistorySchema
  },
  getId: _roomGetId,
  getLinks: _roomGetLinks,
  attach: _roomAttach,
  version: '3.1.0+1',
);

int _roomEstimateSize(
  Room object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      BoardSchema.estimateSize(object.board, allOffsets[Board]!, allOffsets);
  bytesCount += 3 +
      HistorySchema.estimateSize(
          object.history, allOffsets[History]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.playerIds.length * 3;
  {
    for (var i = 0; i < object.playerIds.length; i++) {
      final value = object.playerIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.players.length * 3;
  {
    final offsets = allOffsets[Player]!;
    for (var i = 0; i < object.players.length; i++) {
      final value = object.players[i];
      bytesCount += PlayerSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.rounds.length * 3;
  {
    final offsets = allOffsets[Round]!;
    for (var i = 0; i < object.rounds.length; i++) {
      final value = object.rounds[i];
      bytesCount += RoundSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.state.name.length * 3;
  return bytesCount;
}

void _roomSerialize(
  Room object,
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
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeObject<History>(
    offsets[2],
    allOffsets,
    HistorySchema.serialize,
    object.history,
  );
  writer.writeDateTime(offsets[3], object.lastAccessAt);
  writer.writeString(offsets[4], object.name);
  writer.writeStringList(offsets[5], object.playerIds);
  writer.writeObjectList<Player>(
    offsets[6],
    allOffsets,
    PlayerSchema.serialize,
    object.players,
  );
  writer.writeObjectList<Round>(
    offsets[7],
    allOffsets,
    RoundSchema.serialize,
    object.rounds,
  );
  writer.writeString(offsets[8], object.state.name);
  writer.writeLong(offsets[9], object.winCount);
}

Room _roomDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Room();
  object.board = reader.readObjectOrNull<Board>(
        offsets[0],
        BoardSchema.deserialize,
        allOffsets,
      ) ??
      Board();
  object.createdAt = reader.readDateTime(offsets[1]);
  object.history = reader.readObjectOrNull<History>(
        offsets[2],
        HistorySchema.deserialize,
        allOffsets,
      ) ??
      History();
  object.isarId = id;
  object.lastAccessAt = reader.readDateTime(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.playerIds = reader.readStringList(offsets[5]) ?? [];
  object.players = reader.readObjectList<Player>(
        offsets[6],
        PlayerSchema.deserialize,
        allOffsets,
        Player(),
      ) ??
      [];
  object.rounds = reader.readObjectList<Round>(
        offsets[7],
        RoundSchema.deserialize,
        allOffsets,
        Round(),
      ) ??
      [];
  object.state = _RoomstateValueEnumMap[reader.readStringOrNull(offsets[8])] ??
      GameState.playing;
  return object;
}

P _roomDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<History>(
            offset,
            HistorySchema.deserialize,
            allOffsets,
          ) ??
          History()) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readObjectList<Player>(
            offset,
            PlayerSchema.deserialize,
            allOffsets,
            Player(),
          ) ??
          []) as P;
    case 7:
      return (reader.readObjectList<Round>(
            offset,
            RoundSchema.deserialize,
            allOffsets,
            Round(),
          ) ??
          []) as P;
    case 8:
      return (_RoomstateValueEnumMap[reader.readStringOrNull(offset)] ??
          GameState.playing) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RoomstateEnumValueMap = {
  r'playing': r'playing',
  r'stop': r'stop',
};
const _RoomstateValueEnumMap = {
  r'playing': GameState.playing,
  r'stop': GameState.stop,
};

Id _roomGetId(Room object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _roomGetLinks(Room object) {
  return [];
}

void _roomAttach(IsarCollection<dynamic> col, Id id, Room object) {
  object.isarId = id;
}

extension RoomQueryWhereSort on QueryBuilder<Room, Room, QWhere> {
  QueryBuilder<Room, Room, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RoomQueryWhere on QueryBuilder<Room, Room, QWhereClause> {
  QueryBuilder<Room, Room, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Room, Room, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Room, Room, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Room, Room, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RoomQueryFilter on QueryBuilder<Room, Room, QFilterCondition> {
  QueryBuilder<Room, Room, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> lastAccessAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastAccessAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> lastAccessAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastAccessAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> lastAccessAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastAccessAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> lastAccessAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastAccessAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playerIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playerIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playerIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playerIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerIds',
        value: '',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playerIds',
        value: '',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playerIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playerIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playerIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playerIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playerIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playerIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playerIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playersLengthEqualTo(
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

  QueryBuilder<Room, Room, QAfterFilterCondition> playersIsEmpty() {
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

  QueryBuilder<Room, Room, QAfterFilterCondition> playersIsNotEmpty() {
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

  QueryBuilder<Room, Room, QAfterFilterCondition> playersLengthLessThan(
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

  QueryBuilder<Room, Room, QAfterFilterCondition> playersLengthGreaterThan(
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

  QueryBuilder<Room, Room, QAfterFilterCondition> playersLengthBetween(
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

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rounds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rounds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rounds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rounds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rounds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rounds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateEqualTo(
    GameState value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateGreaterThan(
    GameState value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateLessThan(
    GameState value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateBetween(
    GameState lower,
    GameState upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'state',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> winCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> winCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> winCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> winCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RoomQueryObject on QueryBuilder<Room, Room, QFilterCondition> {
  QueryBuilder<Room, Room, QAfterFilterCondition> board(FilterQuery<Board> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'board');
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> history(
      FilterQuery<History> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'history');
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> playersElement(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'players');
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsElement(
      FilterQuery<Round> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'rounds');
    });
  }
}

extension RoomQueryLinks on QueryBuilder<Room, Room, QFilterCondition> {}

extension RoomQuerySortBy on QueryBuilder<Room, Room, QSortBy> {
  QueryBuilder<Room, Room, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByLastAccessAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessAt', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByLastAccessAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessAt', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByWinCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winCount', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByWinCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winCount', Sort.desc);
    });
  }
}

extension RoomQuerySortThenBy on QueryBuilder<Room, Room, QSortThenBy> {
  QueryBuilder<Room, Room, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByLastAccessAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessAt', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByLastAccessAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessAt', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByWinCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winCount', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByWinCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winCount', Sort.desc);
    });
  }
}

extension RoomQueryWhereDistinct on QueryBuilder<Room, Room, QDistinct> {
  QueryBuilder<Room, Room, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Room, Room, QDistinct> distinctByLastAccessAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAccessAt');
    });
  }

  QueryBuilder<Room, Room, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Room, Room, QDistinct> distinctByPlayerIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerIds');
    });
  }

  QueryBuilder<Room, Room, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Room, Room, QDistinct> distinctByWinCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winCount');
    });
  }
}

extension RoomQueryProperty on QueryBuilder<Room, Room, QQueryProperty> {
  QueryBuilder<Room, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Room, Board, QQueryOperations> boardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'board');
    });
  }

  QueryBuilder<Room, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Room, History, QQueryOperations> historyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'history');
    });
  }

  QueryBuilder<Room, DateTime, QQueryOperations> lastAccessAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAccessAt');
    });
  }

  QueryBuilder<Room, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Room, List<String>, QQueryOperations> playerIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerIds');
    });
  }

  QueryBuilder<Room, List<Player>, QQueryOperations> playersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'players');
    });
  }

  QueryBuilder<Room, List<Round>, QQueryOperations> roundsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rounds');
    });
  }

  QueryBuilder<Room, GameState, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<Room, int, QQueryOperations> winCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winCount');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..createdAt = DateTime.parse(json['createdAt'] as String)
  ..lastAccessAt = DateTime.parse(json['lastAccessAt'] as String)
  ..state = $enumDecode(_$GameStateEnumMap, json['state'])
  ..playerIds =
      (json['playerIds'] as List<dynamic>).map((e) => e as String).toList()
  ..board = Board.fromJson(json['board'] as Map<String, dynamic>)
  ..players = (json['players'] as List<dynamic>)
      .map((e) => Player.fromJson(e as Map<String, dynamic>))
      .toList()
  ..rounds = (json['rounds'] as List<dynamic>)
      .map((e) => Round.fromJson(e as Map<String, dynamic>))
      .toList()
  ..history = History.fromJson(json['history'] as Map<String, dynamic>)
  ..checkingCells = (json['checkingCells'] as List<dynamic>)
      .map((e) => Cell.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastAccessAt': instance.lastAccessAt.toIso8601String(),
      'state': _$GameStateEnumMap[instance.state]!,
      'playerIds': instance.playerIds,
      'board': instance.board.toJson(),
      'players': instance.players.map((e) => e.toJson()).toList(),
      'rounds': instance.rounds.map((e) => e.toJson()).toList(),
      'history': instance.history.toJson(),
      'checkingCells': instance.checkingCells.map((e) => e.toJson()).toList(),
    };

const _$GameStateEnumMap = {
  GameState.playing: 'playing',
  GameState.stop: 'stop',
};
