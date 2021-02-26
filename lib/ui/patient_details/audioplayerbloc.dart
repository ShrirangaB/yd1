import 'package:YOURDRS_FlutterAPP/blocs/audiobloc/audioplayer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AudioPlayerBloc audioplayerBloc =
        BlocProvider.of<AudioplayerBloc>(context);

    return BlocBuilder<AudioplayerBloc, AudioplayerState>(
      key: audioplayerBloc,
      builder: (context, state) {
        return Container(
          height: 200.0,
          color: Colors.cyan[200],
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // Text("${state.episode.name}"),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: FutureBuilder<int>(
                            future: audioPlayerBloc.currentState.player
                                .getCurrentPosition(),
                            builder: (context, AsyncSnapshot<int> snapshot) {
                              double seconds = snapshot.data / 1000;
                              if (snapshot.hasData) {
                                return Text(
                                    "${printDuration(Duration(seconds: seconds.toInt()), abbreviated: true)}");
                              } else {
                                return Text('Calculating..');
                              }
                            },
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: LinearPercentIndicator(
                            lineHeight: 7.0,
//                            percent: this.currentPosition / this.fileDuration,
                            percent: 0.3,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.blue,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FutureBuilder<int>(
                            future: audioPlayerBloc.currentState.player
                                .getDuration(),
                            builder: (context, AsyncSnapshot<int> snapshot) {
                              double seconds = snapshot.data / 1000;
                              if (snapshot.hasData) {
                                return Text(
                                    "${(Duration(seconds: seconds.toInt()), abbreviated: true)}");
                              } else {
                                return Text('Calculating..');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Text(state.player.state.toString()),
                    FlatButton(
                      onPressed: () {
                        print('close here');
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            audioplayerBloc.pause();
                          },
                          child: Text('Pause Player'),
                        ),
                        FlatButton(
                          onPressed: () {
                            audioplayerBloc.resume();
                          },
                          child: Text('Resume Player'),
                        ),
                        FlatButton(
                          onPressed: () {
                            audioplayerBloc.stop();
                          },
                          child: Text('Stop Player'),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
