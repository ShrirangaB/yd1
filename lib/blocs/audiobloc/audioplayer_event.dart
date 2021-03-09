part of 'audioplayer_bloc.dart';

abstract class AudioplayerEvent extends Equatable {}

//----initializing the player
class InitPlayer extends AudioplayerEvent {
  @override
  List<Object> get props => [];
}

//----event for start player
class StartPlayer extends AudioplayerEvent {
  @override
  List<Object> get props => [];
}

//----event for Pause player
class PausePlayer extends AudioplayerEvent {
  @override
  List<Object> get props => [];
}

//----event for Stop player
class StopPlayer extends AudioplayerEvent {
  @override
  List<Object> get props => [];
}

//----event for Completed
class CompletePlayer extends AudioplayerEvent {
  @override
  List<Object> get props => [];
}
