// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ScoreSchema = Schema(
  name: r'Score',
  id: -357457489503241584,
  properties: {
    r'currentScore': PropertySchema(
      id: 0,
      name: r'currentScore',
      type: IsarType.long,
    ),
    r'finalScore': PropertySchema(
      id: 1,
      name: r'finalScore',
      type: IsarType.long,
    ),
    r'initialScore': PropertySchema(
      id: 2,
      name: r'initialScore',
      type: IsarType.long,
    )
  },
  estimateSize: _scoreEstimateSize,
  serialize: _scoreSerialize,
  deserialize: _scoreDeserialize,
  deserializeProp: _scoreDeserializeProp,
);

int _scoreEstimateSize(
  Score object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _scoreSerialize(
  Score object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentScore);
  writer.writeLong(offsets[1], object.finalScore);
  writer.writeLong(offsets[2], object.initialScore);
}

Score _scoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Score();
  object.currentScore = reader.readLong(offsets[0]);
  object.finalScore = reader.readLongOrNull(offsets[1]);
  object.initialScore = reader.readLong(offsets[2]);
  return object;
}

P _scoreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ScoreQueryFilter on QueryBuilder<Score, Score, QFilterCondition> {
  QueryBuilder<Score, Score, QAfterFilterCondition> currentScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> currentScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> currentScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> currentScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> finalScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalScore',
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> finalScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalScore',
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> finalScoreEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> finalScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> finalScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> finalScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> initialScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initialScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> initialScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initialScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> initialScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initialScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> initialScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initialScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScoreQueryObject on QueryBuilder<Score, Score, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Score _$ScoreFromJson(Map<String, dynamic> json) => Score()
  ..currentScore = json['currentScore'] as int
  ..initialScore = json['initialScore'] as int
  ..finalScore = json['finalScore'] as int?;

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'currentScore': instance.currentScore,
      'initialScore': instance.initialScore,
      'finalScore': instance.finalScore,
    };
