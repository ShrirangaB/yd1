import 'package:YOURDRS_FlutterAPP/ui/patient_details/manual_dictaions/audioplayer.dart';
import 'package:YOURDRS_FlutterAPP/widget/modal_bottom_sheet.dart';
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
            trailing: AudioModalBottomSheet(),
          ),
        ],
      ),
    );
  }
}
