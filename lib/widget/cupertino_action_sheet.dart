import 'dart:io';

import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/material_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraActionSheet extends StatefulWidget {
  @override
  _CameraActionSheetState createState() => _CameraActionSheetState();
}

class _CameraActionSheetState extends State<CameraActionSheet> {
  File _image;
  void _show(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: openCamera, child: Text('Camera')),
                CupertinoActionSheetAction(
                    onPressed: openGallery, child: Text('Open Gallery')),
              ],
              cancelButton: CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'),
              ),
            ));
  }

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    });
  }

  // void _close(BuildContext ctx) {
  //   Navigator.of(ctx).pop();
  // }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width * 0.95,
        child: RaisedButton(
          color: CustomizedColors.raisedbuttonColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  color: CustomizedColors.cameraIconcolor,
                  size: 45,
                ),
                Text(
                  'Add Image/Take Picture',
                  style: TextStyle(color: CustomizedColors.raisedButtonText),
                ),
              ],
            ),
          ),
          onPressed: () => _show(context),
        ),
      ),
    ));
  }
}
