import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'audioplayer_event.dart';
part 'audioplayer_state.dart';

class AudioplayerBloc extends Bloc<AudioplayerEvent, AudioplayerState> {
  AudioplayerBloc() : super(AudioplayerBloc.initial());
  StreamSubscription<void> _playerSub;
  AudioPlayer _audio;

  bool _isPlaying = false;
  bool _isPaused = false;

  void _clearPlayer() {
    _isPlaying = false;
    _isPaused = false;
  }

  @override
  Stream<AudioplayerState> mapEventToState(
    AudioplayerEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is InitializePlayer) {
      _audio = AudioPlayer(playerId: widget.id);
      _playerSub = _audio.onPlayerCompletion.listen((event) {
        _clearPlayer();
      });
    }

    if (event is PlayPlayer) {
      Future play() async {
        int result = await _audio.play(
            "https://www.learningcontainer.com/wp-content/uploads/2020/02/Sample-OGG-File.ogg");
        if (result == 1) {
          _isPlaying = true;
        }
      }
    }

    if (event is PausePlayer) {
      Future pause() async {
        int result = await _audio.pause();
        if (result == 1) {
          _isPlaying = false;
        }
      }
    }

    if (event is ResumePlayer) {
      Future resume() async {
        int result = await _audio.resume();
        if (result == 1) {
          _isPlaying = true;
        }
      }
    }
  }
}
