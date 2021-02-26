import 'package:YOURDRS_FlutterAPP/ui/patient_details/manual_dictaions/audioplayer.dart';
import 'package:flutter/material.dart';

class AllDictations extends StatefulWidget {
  @override
  _AllDictationsState createState() => _AllDictationsState();
}

class _AllDictationsState extends State<AllDictations> {
  @override
  Widget build(BuildContext context) {
    return Material(
      //listview for displying the saved audio files
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.audiotrack_outlined),
            title: Text('Audio1.mp4'),
            trailing: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 2, 8),
                  child: Icon(Icons.remove_red_eye, size: 40),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 8, 1, 8),
                  child: Icon(Icons.cloud_done, size: 40),
                ),
                PlayButton(),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack_outlined),
            title: Text('Audio2.mp4'),
            trailing: Wrap(
              children: [
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 8, 2, 8),
                //   child: Icon(Icons.remove_red_eye, size: 40),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 8, 1, 8),
                  child: Icon(Icons.cloud_done, size: 40),
                ),
                PlayButton(),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack_outlined),
            title: Text('Audio3.mp4'),
            trailing: Wrap(
              children: [
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 8, 2, 8),
                //   child: Icon(Icons.remove_red_eye, size: 40),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 8, 1, 8),
                  child: Icon(Icons.cloud_done, size: 40),
                ),
                PlayButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
