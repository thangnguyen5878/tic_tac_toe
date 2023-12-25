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

  OnlineUser({
    String? uid,
    required this.name,
    required this.email,
    bool? isOnline,
    OnlineUserStatus? status,
    String? opponentId,
  })  : this.isOnline = isOnline ?? true,
        this.status = status ?? OnlineUserStatus.idle,
        this.opponentId = opponentId ?? '',
        this.uid = uid ?? Uuid().v4();

  factory OnlineUser.fromJson(Map<String, dynamic> json) => _$OnlineUserFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineUserToJson(this);

  @override
  String toString() {
    return 'OnlineUser{uid: $uid, name: $name, email: $email, isOnline: $isOnline, status: $status, opponentId: $opponentId}';
  }
}