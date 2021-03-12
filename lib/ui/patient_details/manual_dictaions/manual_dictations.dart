import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/manual_dictaions/dictations_lists.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/manual_dictaions/submit_new_dictation.dart';
import 'package:flutter/material.dart';

class ManualDictations extends StatefulWidget {
  @override
  _ManualDictationsState createState() => _ManualDictationsState();
}

class _ManualDictationsState extends State<ManualDictations> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomizedColors.primaryColor,
          title: Text(AppStrings.appBarTitle),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: 150.0),
                child: Material(
                  color: CustomizedColors.tabColor,
                  child: TabBar(
                    tabs: [
                      Tab(
                          child: Text(
                        AppStrings.tabSubmitNew,
                        style: TextStyle(color: CustomizedColors.primaryColor),
                      )),
                      Tab(
                          child: Text(
                        AppStrings.tabAllDictation,
                        style: TextStyle(color: CustomizedColors.primaryColor),
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //--------First screen
                    SubmitNewDictation(),
                    //--------second screen
                    AllDictations(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
