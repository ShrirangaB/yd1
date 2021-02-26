import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/cupertino_action_sheet.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/appointmenttype.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/dictation.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/documenttype.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/location.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/practise.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/provider.dart';
import 'package:flutter/material.dart';

class SubmitNewDictation extends StatefulWidget {
  @override
  _SubmitNewDictationState createState() => _SubmitNewDictationState();
}

class _SubmitNewDictationState extends State<SubmitNewDictation> {
  final fName = TextEditingController();
  final lName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final dateOfService = TextEditingController();
  final descreiption = TextEditingController();

  var _currentSelectedValue;
  var _currencies = [
    "Food",
    "Transport",
  ];
  List<bool> _isSelected = [true, false];

  @override
  void dispose() {
    fName.dispose();
    lName.dispose();
    dateOfBirth.dispose();
    dateOfService.dispose();
    descreiption.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
//---------ListView for the scrolling body
      child: ListView(
        children: [
//------Practise drop down
          Practise(),
          SizedBox(height: 15),

//------Location drop down
          Location(),
          SizedBox(height: 15),

//------Provider drop down
          Provider(),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              AppStrings.fName,
              style: TextStyle(
                fontSize: 17,
                color: CustomizedColors.accentColor,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: CustomizedColors.primaryColor, width: 1.6)),

//-------TextFeild for First Name
              child: TextField(
                controller: fName,
              )),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              AppStrings.lName,
              style: TextStyle(
                fontSize: 17,
                color: CustomizedColors.accentColor,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: CustomizedColors.primaryColor, width: 1.6)),
//-------TextFeild last name
              child: TextField(
                controller: lName,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              AppStrings.dobDropDownText,
              style: TextStyle(
                fontSize: 17,
                color: CustomizedColors.accentColor,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: CustomizedColors.primaryColor, width: 1.6)),
//-------TextFeild for date of Birth
              child: TextField(
                controller: dateOfBirth,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              AppStrings.dosDropDownText,
              style: TextStyle(
                fontSize: 17,
                color: CustomizedColors.accentColor,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: CustomizedColors.primaryColor, width: 1.6)),
//-------TextFeild
              child: TextField(
                controller: dateOfService,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
          SizedBox(height: 15),
          DocumentType(),

          SizedBox(height: 15),

          AppointmentType(),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              AppStrings.emergencyText,
              style: TextStyle(
                fontSize: 17,
                color: CustomizedColors.accentColor,
              ),
            ),
          ),
          SizedBox(height: 15),
//-----------------Toggle button
          ToggleButtons(
            children: <Widget>[Text('Yes'), Text('No')],
            isSelected: _isSelected,
            onPressed: (int index) {
              setState(() {
                _isSelected[index] = !_isSelected[index];
              });
            },
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              AppStrings.descp,
              style: TextStyle(
                fontSize: 17,
                color: CustomizedColors.accentColor,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: CustomizedColors.primaryColor, width: 1.6)),
//-------TextFeild
              child: TextField(
                controller: descreiption,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
          SizedBox(height: 15),
//-----cupertino Action sheet
          CameraActionSheet(),
          SizedBox(height: 15),
//------raised Button for Submit with Dictation
          RaisedButtonCustom(
            onPressed: () {},
            text: AppStrings.submitwithDictButtonText,
          ),
          SizedBox(height: 15),
//------raised Button for Submitting
          RaisedButtonCustom(
            onPressed: () {},
            text: AppStrings.submitButtonText,
          ),
          SizedBox(height: 15),
//------raised Button for clearing all the textediting controllers
          RaisedButtonCustom(
            onPressed: () {
              fName.clear();
              lName.clear();
              dateOfBirth.clear();
              dateOfService.clear();
              descreiption.clear();
            },
            text: AppStrings.clearAll,
          )
        ],
      ),
    );
  }
}
