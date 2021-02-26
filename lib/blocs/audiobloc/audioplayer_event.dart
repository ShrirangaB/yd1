part of 'audioplayer_bloc.dart';

@immutable
abstract class AudioplayerEvent {}

class InitializePlayer extends AudioplayerEvent {}

class PlayPlayer extends AudioplayerEvent {
  final String id;
  final String url;

  const PlayPlayer({Key key, this.url, this.id}) : super(key: key);
}

class PausePlayer extends AudioplayerEvent {}

class ResumePlayer extends AudioplayerEvent {}

class ClearPlayer extends AudioplayerEvent {}
