import 'package:flutter_tic_tac_toe/utils/enums/online_player_status.dart';

class OnlinePlayer {
  String name;
  String email;
  bool? isOnline;
  OnlinePlayerStatus status;


  OnlinePlayer({required this.name, required this.email, this.isOnline, OnlinePlayerStatus? status})
    : this.status = status ?? OnlinePlayerStatus.idle;

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'email': this.email,
      'isOnline': this.isOnline,
      'status': this.status,
    };
  }

  factory OnlinePlayer.fromJson(Map<String, dynamic> map) {
    return OnlinePlayer(
      name: map['name'] as String,
      email: map['email'] as String,
      isOnline: map['isOnline'] as bool,
      status: map['status'] as OnlinePlayerStatus,
    );
  }
}