import 'package:json_annotation/json_annotation.dart';

enum GameState {
  @JsonValue("playing") playing,
  @JsonValue("stop") stop;

  @override
  String toString() {
    switch (this) {
      case GameState.playing:
        return 'playing';
      case GameState.stop:
        return 'stop';
    }
  }

  static GameState fromString(String state) {
    switch (state) {
      case 'playing':
        return GameState.playing;
      case 'stop':
        return GameState.stop;
      default:
        throw Exception('Invalid state string: $state');
    }
  }
}
