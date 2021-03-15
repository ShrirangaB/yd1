import 'dart:async';

import 'package:YOURDRS_FlutterAPP/widget/audioplayer/audioplayerr.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audioplayer_event.dart';
part 'audioplayer_state.dart';

class AudioplayerBloc extends Bloc<AudioplayerEvent, AudioplayerState> {
  // AudioPlayer audioPlayer;
  AudioplayerBloc() : super(AudioplayerInitial());

  @override
  Stream<AudioplayerState> mapEventToState(
    AudioplayerEvent event,
  ) async* {
    if (event is InitPlayer) {
      yield* _initAudioPlayer();
    }
    //play
    else if (event is StartPlayer) {
      yield* _play();
    }
    //pause
    else if (event is PausePlayer) {
      yield* _pause();
    }
    //stop
    else if (event is StopPlayer) {
      yield* _stop();
    }
    //on Complete
    else if (event is CompletePlayer) {
      yield* _stop();
    }
  }

  //stream for init
  Stream<AudioplayerState> _initAudioPlayer() async* {
    try {} catch (e) {
      print(e.toString());
    }
  }

  //stream for playing audio
  Stream<AudioplayerState> _play() async* {
    try {} catch (e) {
      print(e.toString());
    }
  }

  //stream for pause
  Stream<AudioplayerState> _pause() async* {
    try {} catch (e) {
      print(e.toString());
    }
  }

  //stream for stop
  Stream<AudioplayerState> _stop() async* {
    try {} catch (e) {
      print(e.toString());
    }
  }
}
