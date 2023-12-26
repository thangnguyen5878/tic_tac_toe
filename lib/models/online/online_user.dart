import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'online_user.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineUser {
  String uid;
  String name;
  String email;
  bool isOnline;
  OnlineUserStatus status;
  String opponentId;
  String currentRoomId;
  int? playerIndex;

  OnlineUser({
    String? uid,
    required this.name,
    required this.email,
    bool? isOnline,
    OnlineUserStatus? status,
    String? opponentId,
    String? currentRoomId,
    this.playerIndex
  })  : isOnline = isOnline ?? true,
        status = status ?? OnlineUserStatus.idle,
        opponentId = opponentId ?? '',
        uid = uid ?? const Uuid().v4(),
        currentRoomId = currentRoomId ?? '';

  factory OnlineUser.fromJson(Map<String, dynamic> json) => _$OnlineUserFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineUserToJson(this);

  @override
  String toString() {
    return 'OnlineUser{uid: $uid, name: $name, email: $email, isOnline: $isOnline, status: $status, opponentId: $opponentId, currentRoomId: $currentRoomId, playerIndex: $playerIndex}';
  }
}