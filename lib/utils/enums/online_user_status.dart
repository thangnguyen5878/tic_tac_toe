import 'package:json_annotation/json_annotation.dart';

const onlineUserStatusEnumMap = {
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
  @JsonValue("offline") offline,
  @JsonValue("win") win,
  @JsonValue("lose") lose,
  @JsonValue("rematch pending") rematchPending,
  @JsonValue("round completed") roundCompleted;

  String toShortString() {
    if(this != null) {
      return onlineUserStatusEnumMap[this]!;
    } else {
      return 'unknown status';
    }
  }
}
