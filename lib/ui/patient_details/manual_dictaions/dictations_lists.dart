import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';

import 'package:YOURDRS_FlutterAPP/network/models/dictations_model.dart';

import 'package:YOURDRS_FlutterAPP/widget/audioplayer/audioplayerr.dart';

import 'package:flutter/material.dart';

class DictationsList extends StatefulWidget {
  @override
  _DictationsListState createState() => _DictationsListState();
}

class _DictationsListState extends State<DictationsList> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    List<DictationItem> list = args['allDictation'];
    @override
    Widget build(BuildContext context) {
      final List<DictationItem> args =
          ModalRoute.of(context).settings.arguments;

      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;
      return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20,
              vertical: MediaQuery.of(context).size.height / 50,
            ),
            child: ListView.builder(
              itemCount: args.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppStrings.textUploaded,
                            style: TextStyle(
                                color: CustomizedColors.activeRedColor,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: width * 0.045,
                          ),
                          Icon(
                            Icons.cloud_done,
                            size: 30,
                            color: CustomizedColors.accentColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            args[index].displayFileName ?? "",
                            style: TextStyle(fontSize: 16),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye,
                              size: 30,
                            ),
                            color: CustomizedColors.cameraIconcolor,
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: height * 0.55,
                                    child: Center(
                                      child: Container(
                                        height: height * 0.50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.90,
                                        child: ListView(
                                          children: [
                                            Column(
                                              children: [
                                                AudioApp(),
                                                MaterialButton(
                                                  child: Text(
                                                    'Cancel',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  color: CustomizedColors
                                                      .cameraIconcolor,
                                                  shape: StadiumBorder(),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.play_circle_fill,
                              size: 30,
                            ),
                            color: CustomizedColors.accentColor,
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
  }
}
