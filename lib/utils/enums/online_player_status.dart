enum OnlinePlayerStatus {
  idle,
  waiting,
  invited,
  rejected,
  inviteTimeout,
  inGame,
}

extension OnlinePlayerStatusExtension on OnlinePlayerStatus {
  String toCustomString() {
    switch (this) {
      case OnlinePlayerStatus.idle:
        return "Idle";
      case OnlinePlayerStatus.waiting:
        return "Waiting";
      case OnlinePlayerStatus.invited:
        return "Invited";
      case OnlinePlayerStatus.rejected:
        return "Rejected";
      case OnlinePlayerStatus.inviteTimeout:
        return "Invite Timeout";
      case OnlinePlayerStatus.inGame:
        return "In Game";
    }
  }
}