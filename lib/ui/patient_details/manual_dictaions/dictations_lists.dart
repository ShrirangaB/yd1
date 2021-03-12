import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';

import 'package:YOURDRS_FlutterAPP/network/models/dictations_model.dart';
import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';
import 'package:YOURDRS_FlutterAPP/widget/audioplayer/audioplayerr.dart';
import 'package:YOURDRS_FlutterAPP/widget/modal_bottom_sheet.dart';

//import 'package:YOURDRS_FlutterAPP/widget/buttons/mic_button.dart';
import 'package:flutter/material.dart';

class AllDictations extends StatefulWidget {
  @override
  _AllDictationsState createState() => _AllDictationsState();
}

class _AllDictationsState extends State<AllDictations>
    with AutomaticKeepAliveClientMixin {
  List allDtion = List();
  Services apiServices = Services();

  void didChangeDependencies() async {
    super.didChangeDependencies();
    Dictations allDictations = await apiServices.getDictations();

    allDtion = allDictations.audioDictations;
    print(allDtion.length);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 20,
        vertical: MediaQuery.of(context).size.height / 50,
      ),
      child: ListView.builder(
        itemCount: allDtion.length,
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
                          color: CustomizedColors.accentColor, fontSize: 16),
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
                      allDtion[index].displayFileName ?? "",
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
                      color: CustomizedColors.homeSubtitleColor,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        AudioModalBottomSheet();
                      },
                      icon: Icon(
                        Icons.play_circle_fill,
                        size: 30,
                      ),
                      color: CustomizedColors.homeSubtitleColor,
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
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
