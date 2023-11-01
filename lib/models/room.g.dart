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
    r'currentHistoryRoundIndex': PropertySchema(
      id: 1,
      name: r'currentHistoryRoundIndex',
      type: IsarType.long,
    ),
    r'currentRoundIndex': PropertySchema(
      id: 2,
      name: r'currentRoundIndex',
      type: IsarType.long,
    ),
    r'historyBoard': PropertySchema(
      id: 3,
      name: r'historyBoard',
      type: IsarType.object,
      target: r'Board',
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'rounds': PropertySchema(
      id: 5,
      name: r'rounds',
      type: IsarType.objectList,
      target: r'Round',
    ),
    r'state': PropertySchema(
      id: 6,
      name: r'state',
      type: IsarType.string,
      enumMap: _RoomstateEnumValueMap,
    ),
    r'winCount': PropertySchema(
      id: 7,
      name: r'winCount',
      type: IsarType.long,
    )
  },
  estimateSize: _roomEstimateSize,
  serialize: _roomSerialize,
  deserialize: _roomDeserialize,
  deserializeProp: _roomDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Board': BoardSchema,
    r'Round': RoundSchema,
    r'Player': PlayerSchema,
    r'Cell': CellSchema
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
      BoardSchema.estimateSize(
          object.historyBoard, allOffsets[Board]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  {
    final list = object.rounds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Round]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          if (value != null) {
            bytesCount += RoundSchema.estimateSize(value, offsets, allOffsets);
          }
        }
      }
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
  writer.writeLong(offsets[1], object.currentHistoryRoundIndex);
  writer.writeLong(offsets[2], object.currentRoundIndex);
  writer.writeObject<Board>(
    offsets[3],
    allOffsets,
    BoardSchema.serialize,
    object.historyBoard,
  );
  writer.writeString(offsets[4], object.name);
  writer.writeObjectList<Round>(
    offsets[5],
    allOffsets,
    RoundSchema.serialize,
    object.rounds,
  );
  writer.writeString(offsets[6], object.state.name);
  writer.writeLong(offsets[7], object.winCount);
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
  object.currentHistoryRoundIndex = reader.readLong(offsets[1]);
  object.currentRoundIndex = reader.readLong(offsets[2]);
  object.historyBoard = reader.readObjectOrNull<Board>(
        offsets[3],
        BoardSchema.deserialize,
        allOffsets,
      ) ??
      Board();
  object.id = id;
  object.name = reader.readString(offsets[4]);
  object.rounds = reader.readObjectOrNullList<Round>(
    offsets[5],
    RoundSchema.deserialize,
    allOffsets,
  );
  object.state = _RoomstateValueEnumMap[reader.readStringOrNull(offsets[6])] ??
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
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<Board>(
            offset,
            BoardSchema.deserialize,
            allOffsets,
          ) ??
          Board()) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readObjectOrNullList<Round>(
        offset,
        RoundSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (_RoomstateValueEnumMap[reader.readStringOrNull(offset)] ??
          GameState.playing) as P;
    case 7:
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
  return object.id;
}

List<IsarLinkBase<dynamic>> _roomGetLinks(Room object) {
  return [];
}

void _roomAttach(IsarCollection<dynamic> col, Id id, Room object) {
  object.id = id;
}

extension RoomQueryWhereSort on QueryBuilder<Room, Room, QWhere> {
  QueryBuilder<Room, Room, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RoomQueryWhere on QueryBuilder<Room, Room, QWhereClause> {
  QueryBuilder<Room, Room, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Room, Room, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Room, Room, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Room, Room, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RoomQueryFilter on QueryBuilder<Room, Room, QFilterCondition> {
  QueryBuilder<Room, Room, QAfterFilterCondition>
      currentHistoryRoundIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentHistoryRoundIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition>
      currentHistoryRoundIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentHistoryRoundIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition>
      currentHistoryRoundIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentHistoryRoundIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition>
      currentHistoryRoundIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentHistoryRoundIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> currentRoundIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentRoundIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> currentRoundIndexGreaterThan(
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

  QueryBuilder<Room, Room, QAfterFilterCondition> currentRoundIndexLessThan(
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

  QueryBuilder<Room, Room, QAfterFilterCondition> currentRoundIndexBetween(
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

  QueryBuilder<Room, Room, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
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

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rounds',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rounds',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'rounds',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> roundsElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'rounds',
      ));
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

  QueryBuilder<Room, Room, QAfterFilterCondition> historyBoard(
      FilterQuery<Board> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'historyBoard');
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
  QueryBuilder<Room, Room, QAfterSortBy> sortByCurrentHistoryRoundIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHistoryRoundIndex', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByCurrentHistoryRoundIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHistoryRoundIndex', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByCurrentRoundIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRoundIndex', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> sortByCurrentRoundIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRoundIndex', Sort.desc);
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
  QueryBuilder<Room, Room, QAfterSortBy> thenByCurrentHistoryRoundIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHistoryRoundIndex', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByCurrentHistoryRoundIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHistoryRoundIndex', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByCurrentRoundIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRoundIndex', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByCurrentRoundIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRoundIndex', Sort.desc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Room, Room, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
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
  QueryBuilder<Room, Room, QDistinct> distinctByCurrentHistoryRoundIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentHistoryRoundIndex');
    });
  }

  QueryBuilder<Room, Room, QDistinct> distinctByCurrentRoundIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentRoundIndex');
    });
  }

  QueryBuilder<Room, Room, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
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
  QueryBuilder<Room, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Room, Board, QQueryOperations> boardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'board');
    });
  }

  QueryBuilder<Room, int, QQueryOperations> currentHistoryRoundIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentHistoryRoundIndex');
    });
  }

  QueryBuilder<Room, int, QQueryOperations> currentRoundIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentRoundIndex');
    });
  }

  QueryBuilder<Room, Board, QQueryOperations> historyBoardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'historyBoard');
    });
  }

  QueryBuilder<Room, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Room, List<Round?>?, QQueryOperations> roundsProperty() {
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
