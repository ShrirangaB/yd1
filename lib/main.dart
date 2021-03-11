import 'package:YOURDRS_FlutterAPP/ui/patient_details/manual_dictaions/dictations_lists.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/manual_dictaions/manual_dictations.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/manual_dictaions/submit_new_dictation.dart';

import 'package:YOURDRS_FlutterAPP/widget/dateofbirthpicker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DictationsList(),
    );
  }
}
