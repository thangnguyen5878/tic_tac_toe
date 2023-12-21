import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_user.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineUser {
  String name;
  String email;
  bool? isOnline;
  OnlineUserStatus status;
  String? opponentId;

  // @DocumentReferenceConverter()
  // DocumentReference<Map<String, dynamic>>? userRef;

  OnlineUser({required this.name, required this.email, this.isOnline, OnlineUserStatus? status, this.opponentId})
    : this.status = status ?? OnlineUserStatus.idle;

  factory OnlineUser.fromJson(Map<String, dynamic> json) => _$OnlineUserFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineUserToJson(this);

  @override
  String toString() {
    return 'OnlineUser{name: $name, email: $email, isOnline: $isOnline, status: $status, opponentId: $opponentId}';
  }

// Map<String, dynamic> toJson() {
  //   return {
  //     'name': this.name,
  //     'email': this.email,
  //     'isOnline': this.isOnline,
  //     'status': this.status,
  //     'opponentId': this.opponentId
  //   };
  // }
  //
  // factory OnlineUser.fromJson(Map<String, dynamic> map) {
  //   return OnlineUser(
  //     name: map['name'] as String,
  //     email: map['email'] as String,
  //     isOnline: map['isOnline'] as bool,
  //     status: map['status'] as OnlinePlayerStatus,
  //     opponentId: map['opponentId'] as String
  //   );
  // }
}