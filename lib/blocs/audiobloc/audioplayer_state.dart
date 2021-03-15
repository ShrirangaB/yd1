part of 'audioplayer_bloc.dart';

abstract class AudioplayerState extends Equatable {
  final String errorMsg;
  final PlayerState playerState;
  final Duration duration;

  factory AudioplayerState.initial() => AudioplayerState(errorMsg :null,
  );

  // final Position position;

  @override
  List<Object> get props => [this.errorMsg, this.playerState, this.duration];
}

class AudioplayerInitial extends AudioplayerState {}
