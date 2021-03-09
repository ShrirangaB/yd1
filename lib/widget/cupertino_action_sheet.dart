import 'dart:io';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CameraActionSheet extends StatefulWidget {
  @override
  _CameraActionSheetState createState() => _CameraActionSheetState();
}

class _CameraActionSheetState extends State<CameraActionSheet>
    with AutomaticKeepAliveClientMixin {
  bool widgetVisible = false;
  bool visible = false;
  Directory directory;
  bool isSwitched = false;
  List imageArray = [];
  //File image;
  int gIndex;
  String fileName;
  String filepath;
  Map<String, String> paths;
  List<String> extensions;
  bool isLoadingPath = false;
  bool isMultiPick = false;
  FileType fileType;
  bool imageVisible = true;
  File image;

  ///---------------to open cupertino action sheet
  void _show(BuildContext ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (ctctc) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: () {
                  openCamera();
                  Navigator.pop(ctctc);
                },
                child: Text('Camera')),
            CupertinoActionSheetAction(
                onPressed: () {
                  openGallery();
                  Navigator.pop(ctctc);
                },
                child: Text('Open Gallery')),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            //isDefaultAction: true,
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(ctctc);
            },
          )),
    );
  }

  ///-----------------to open the camera in phone
  Future openCamera() async {
    image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    //String path = image.path;
    //createFileName(path);
    setState(() {
      image;
      widgetVisible = true;
      visible = false;
    });
  }

  ///---------------------to open the gallery in phone
  Future openGallery() async {
    setState(() => isLoadingPath = true);
    try {
      if (!isMultiPick) {
        filepath = null;
        paths = await FilePicker.getMultiFilePath(
            type: fileType != null ? fileType : FileType.image,
            allowedExtensions: extensions);
        print(paths);
      } else {
        filepath = await FilePicker.getFilePath(
            type: fileType != null ? fileType : FileType.image,
            allowedExtensions: extensions);
        print(filepath);
        paths = null;
      }
    } on PlatformException catch (e) {
      print("file not fund" + e.toString());
    }
    try {
      if (!mounted) return;
      setState(() {
        isLoadingPath = false;
        fileName = filepath != null
            ? filepath.split('/').last
            : paths != null
                ? paths.keys.toString()
                : '...';
        visible = true;
        widgetVisible = false;
      });
    } on PlatformException catch (e) {
      print("file not found" + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void _close(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ///-----------------------display the camera images to the ui
          Visibility(
            visible: widgetVisible,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomizedColors.homeSubtitleColor,
                        ),
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.85,
                      // color: Colors.green,

                      child: Center(

                          // color: CustomizedColors.homeSubtitleColor,
                          child: Stack(children: [
                        image == null
                            ? Text("no image selected")
                            : Image.file(
                                image,
                                fit: BoxFit.contain,
                              ),
                        Positioned(
                          right: -10,
                          top: -5,
                          child: Visibility(
                            visible: imageVisible,
                            child: IconButton(
                              icon: new Icon(
                                Icons.close,
                                color: CustomizedColors.signInButtonTextColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  image = null;
                                  imageVisible = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ])),
                    ),
                  ]),
                ],
              ),
            ),
          ),

          ///------------------display the gallery for selecting the images
          Visibility(
            visible: visible,
            child: Column(
              children: [
                Builder(
                  builder: (BuildContext context) => isLoadingPath
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const CircularProgressIndicator())
                      : filepath != null ||
                              (paths != null &&
                                  paths.values != null &&
                                  paths.values.isNotEmpty)
                          ? new Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CustomizedColors.homeSubtitleColor,
                                ),
                              ),
                              //   padding: const EdgeInsets.only(bottom: 30.0),
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: new ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: paths != null && paths.isNotEmpty
                                    ? paths.length
                                    : 1,
                                itemBuilder: (BuildContext context, index) {
                                  final bool isMultiPath =
                                      paths != null && paths.isNotEmpty;
                                  final filePath1 = isMultiPath
                                      ? paths.values.toList()[index].toString()
                                      : filepath;
                                  print(filePath1);
                                  return Container(
                                    color: CustomizedColors.homeSubtitleColor,
                                    margin: const EdgeInsets.all(8),
                                    child: Stack(children: [
                                      filePath1 != null
                                          ? Image.file(
                                              File(filePath1),
                                              fit: BoxFit.contain,
                                            )
                                          : Container(),
                                      Positioned(
                                        right: -10,
                                        top: -5,
                                        child: IconButton(
                                          icon: new Icon(
                                            Icons.close,
                                            //color: CustomizedColors.signInButtonTextColor,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              // paths.values.toList().removeAt(index);
                                              var filename = basename(
                                                  paths.values.toList()[index]);
                                              print(
                                                  'remove filename $fileName');
                                              paths.remove(filename);
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        new Divider(),
                              ),
                            )
                          : new Container(),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // //storing images into separate folder
                // RaisedBtn(
                //     text: AppStrings.submitImages,
                //     onPressed: () {
                //       setState(() {
                //         widgetVisible = false;
                //         visible = false;
                //       });
                //     },
                //     iconData: Icons.image),
              ],
            ),
          ),
          SizedBox(height: 15),
          CupertinoPageScaffold(
            child: Center(
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.85,
                child: RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: CustomizedColors.accentColor,
                          size: 45,
                        ),
                        Text(
                          'Add Image/Take Picture',
                          style: TextStyle(color: CustomizedColors.accentColor),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () => _show(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
