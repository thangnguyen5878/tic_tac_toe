// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineUser _$OnlineUserFromJson(Map<String, dynamic> json) => OnlineUser(
      uid: json['uid'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      isOnline: json['isOnline'] as bool?,
      status: $enumDecodeNullable(_$OnlineUserStatusEnumMap, json['status']),
      opponentId: json['opponentId'] as String?,
      currentRoomId: json['currentRoomId'] as String?,
      playerIndex: json['playerIndex'] as int?,
    );

Map<String, dynamic> _$OnlineUserToJson(OnlineUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'isOnline': instance.isOnline,
      'status': _$OnlineUserStatusEnumMap[instance.status]!,
      'opponentId': instance.opponentId,
      'currentRoomId': instance.currentRoomId,
      'playerIndex': instance.playerIndex,
    };

const _$OnlineUserStatusEnumMap = {
  OnlineUserStatus.idle: 'idle',
  OnlineUserStatus.waitingForInvitation: 'waiting for invitation',
  OnlineUserStatus.invited: 'invited',
  OnlineUserStatus.inGame: 'in game',
  OnlineUserStatus.invitationRejected: 'invitation rejected',
  OnlineUserStatus.invitedButNoRespond: 'invited but no respond',
  OnlineUserStatus.invitationWaitingTimeout: 'invitation waiting timeout',
  OnlineUserStatus.invitaionWaitingCanceled: 'invitation waiting canceled',
  OnlineUserStatus.opponentQuitted: 'opponent quitted',
  OnlineUserStatus.inWelcomePage: 'in welcome page',
  OnlineUserStatus.offline: 'offline',
  OnlineUserStatus.win: 'win',
  OnlineUserStatus.lose: 'lose',
  OnlineUserStatus.rematchPending: 'rematch pending',
  OnlineUserStatus.roundCompleted: 'round completed',
};
