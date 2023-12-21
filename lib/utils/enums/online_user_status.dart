import 'package:json_annotation/json_annotation.dart';

enum OnlineUserStatus {
  @JsonValue("idle") idle,
  @JsonValue("waiting") waiting,
  @JsonValue("invited") invited,
  @JsonValue("rejected") rejected,
  @JsonValue("invite timeout") inviteTimeout,
  @JsonValue("waiting canceled") waitingCanceled,
  @JsonValue("in game") inGame,
  @JsonValue("opponent quit game") opponentQuitGame;

  String toReadableString() {
    switch (this) {
      case OnlineUserStatus.idle:
        return "idle";
      case OnlineUserStatus.waiting:
        return "waiting";
      case OnlineUserStatus.invited:
        return "invited";
      case OnlineUserStatus.rejected:
        return "rejected";
      case OnlineUserStatus.inviteTimeout:
        return "invite timeout";
      case OnlineUserStatus.waitingCanceled:
        return "waiting canceled";
      case OnlineUserStatus.inGame:
        return "in game";
      case OnlineUserStatus.opponentQuitGame:
        return "opponent quit game";
    }
  }
}
