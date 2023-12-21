// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineUser _$OnlineUserFromJson(Map<String, dynamic> json) => OnlineUser(
      name: json['name'] as String,
      email: json['email'] as String,
      isOnline: json['isOnline'] as bool?,
      status: $enumDecodeNullable(_$OnlineUserStatusEnumMap, json['status']),
      opponentId: json['opponentId'] as String?,
    );

Map<String, dynamic> _$OnlineUserToJson(OnlineUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'isOnline': instance.isOnline,
      'status': _$OnlineUserStatusEnumMap[instance.status]!,
      'opponentId': instance.opponentId,
    };

const _$OnlineUserStatusEnumMap = {
  OnlineUserStatus.idle: 'idle',
  OnlineUserStatus.waiting: 'waiting',
  OnlineUserStatus.invited: 'invited',
  OnlineUserStatus.rejected: 'rejected',
  OnlineUserStatus.inviteTimeout: 'invite timeout',
  OnlineUserStatus.waitingCanceled: 'waiting canceled',
  OnlineUserStatus.inGame: 'in game',
  OnlineUserStatus.opponentQuitGame: 'opponent quit game',
};
