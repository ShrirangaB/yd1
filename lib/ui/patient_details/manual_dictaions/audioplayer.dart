// import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class PlayButton extends StatefulWidget {
//   final String id;
//   final String url;

//   const PlayButton({Key key, this.url, this.id}) : super(key: key);

//   @override
//   _PlayButtonState createState() => _PlayButtonState();
// }

// class _PlayButtonState extends State<PlayButton> {
//   StreamSubscription<void> _playerSub;
//   AudioPlayer _audio;

//   bool _isPlaying = false;
//   bool _isPaused = false;

//   @override
//   void initState() {
//     super.initState();
//     _audio = AudioPlayer(playerId: widget.id);
//     _playerSub = _audio.onPlayerCompletion.listen((event) {
//       _clearPlayer();
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _playerSub.cancel();
//     _audio.dispose();
//   }

//   void _clearPlayer() {
//     setState(() {
//       _isPlaying = false;
//       _isPaused = false;
//     });
//   }

// //--------passing the Remoteurl in play.
//   Future play() async {
//     int result = await _audio.play(
//         "https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3");
//     if (result == 1) {
//       setState(() {
//         _isPlaying = true;
//       });
//     }
//   }

//   Future pause() async {
//     int result = await _audio.pause();
//     if (result == 1) {
//       setState(() {
//         _isPlaying = false;
//       });
//     }
//   }

//   Future resume() async {
//     int result = await _audio.resume();
//     if (result == 1) {
//       setState(() {
//         _isPlaying = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: (_isPlaying)
//           ? Icon(Icons.pause_circle_outline_outlined)
//           : Icon(Icons.play_circle_outline),
//       iconSize: 40,
//       onPressed: () => _isPlaying
//           ? pause()
//           : _isPaused
//               ? resume()
//               : play(),
//     );
//   }
// }
