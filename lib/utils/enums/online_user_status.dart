import 'package:json_annotation/json_annotation.dart';

enum OnlineUserStatus {
  @JsonValue("idle") idle,
  @JsonValue("waiting for invitation") waitingForInvitation,
  @JsonValue("invited") invited,
  @JsonValue("in game") inGame,
  @JsonValue("invitation rejected") invitationRejected,
  @JsonValue("invited but no respond") invitedButNoRespond,
  @JsonValue("invitation waiting timeout") invitationWaitingTimeout,
  @JsonValue("waiting canceled") waitingCanceled,
  @JsonValue("opponent quitted") opponentQuitted;

  String toShortString() {
    switch (this) {
      case OnlineUserStatus.idle:
        return "idle";
      case OnlineUserStatus.waitingForInvitation:
        return "waiting for invitation";
      case OnlineUserStatus.invited:
        return "invited";
      case OnlineUserStatus.inGame:
        return "in game";
      case OnlineUserStatus.invitationRejected:
        return "invitation rejected";
      case OnlineUserStatus.invitedButNoRespond:
        return "invited but no respond";
      case OnlineUserStatus.invitationWaitingTimeout:
        return "invitation waiting timeout";
      case OnlineUserStatus.waitingCanceled:
        return "waiting canceled";
      case OnlineUserStatus.opponentQuitted:
        return "opponent quitted";
      default:
        return "unknown status";
    }
  }
}
