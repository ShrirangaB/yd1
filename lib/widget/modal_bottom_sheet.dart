import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/widget/audioplayer/audioplayerr.dart';
import 'package:flutter/material.dart';

class AudioModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.play_circle_outline, size: 40),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 370,
              child: Center(
                child: Container(
                  height: 320,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Column(
                    children: [
                      AudioApp(),
                      MaterialButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 18),
                        ),
                        color: CustomizedColors.cameraIconcolor,
                        shape: StadiumBorder(),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
