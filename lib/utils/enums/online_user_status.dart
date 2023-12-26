import 'package:json_annotation/json_annotation.dart';

enum OnlineUserStatus {
  @JsonValue("idle") idle,
  @JsonValue("waiting for invitation") waitingForInvitation,
  @JsonValue("invited") invited,
  @JsonValue("in game") inGame,
  @JsonValue("invitation rejected") invitationRejected,
  @JsonValue("invited but no respond") invitedButNoRespond,
  @JsonValue("invitation waiting timeout") invitationWaitingTimeout,
  @JsonValue("invitation waiting canceled") invitaionWaitingCanceled,
  @JsonValue("opponent quitted") opponentQuitted,
  @JsonValue("in welcome page") inWelcomePage,
  @JsonValue("offline") offline;

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
      case OnlineUserStatus.invitaionWaitingCanceled:
        return "invitation waiting canceled";
      case OnlineUserStatus.opponentQuitted:
        return "opponent quitted";
      case OnlineUserStatus.inWelcomePage: // Trạng thái mới
        return "in welcome page";
      case OnlineUserStatus.offline: // Trạng thái mới
        return "offline";
      default:
        return "unknown status";
    }
  }
}
