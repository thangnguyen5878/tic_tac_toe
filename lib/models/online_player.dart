class OnlinePlayer {
  String name;
  String email;
  bool? isOnline;

  OnlinePlayer({required this.name, required this.email, this.isOnline});

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'email': this.email,
      'isOnline': this.isOnline,
    };
  }

  factory OnlinePlayer.fromJson(Map<String, dynamic> map) {
    return OnlinePlayer(
      name: map['name'] as String,
      email: map['email'] as String,
      isOnline: map['isOnline'] as bool,
    );
  }
}