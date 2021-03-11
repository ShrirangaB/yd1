import 'dart:ffi';

import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';

import 'package:YOURDRS_FlutterAPP/network/models/location_field_model.dart';
import 'package:YOURDRS_FlutterAPP/network/models/practice.dart';
import 'package:YOURDRS_FlutterAPP/network/models/provider_model.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/cupertino_action_sheet.dart';
import 'package:YOURDRS_FlutterAPP/widget/dateofbirthpicker.dart';
import 'package:YOURDRS_FlutterAPP/widget/dateofservicepicker.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/appointmenttype.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/documenttype.dart';

import 'package:YOURDRS_FlutterAPP/widget/dropdowns/location_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/practice_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/provider_field.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class SubmitNewDictation extends StatefulWidget {
  @override
  _SubmitNewDictationState createState() => _SubmitNewDictationState();
}

class _SubmitNewDictationState extends State<SubmitNewDictation>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  final _fName = TextEditingController();
  final _lName = TextEditingController();
  final _descreiption = TextEditingController();
  String _selectedLocation;
  String _selectedPractice;
  String _selectedProvider;
  // var _currentSelectedValue;
  String currentDOB;
  String currentDOS;
  String toggleVal;
  // String currentPractice;
  String selectedDocumentType;

  List<bool> _isSelected = [true, false];

  // @override
  // bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
//---------ListView for the scrolling body
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
//-----------text for Practise
                Text(
                  AppStrings.practice,
                  style: TextStyle(
                    fontSize: 17,
                    color: CustomizedColors.accentColor,
                  ),
                ),
                SizedBox(height: 15),
//------Practise drop down
                PracticeDropDown(
                  onTapOfPractice: (PracticeList pValue) {
                    setState(() {
                      _selectedPractice = '${pValue?.id}';

                      print('Practice from UI: ${pValue?.id}');
                    });
                  },
                ),
                SizedBox(height: 15),
//-----------text for provider
                Text(
                  AppStrings.location,
                  style: TextStyle(
                    fontSize: 17,
                    color: CustomizedColors.accentColor,
                  ),
                ),
                SizedBox(height: 15),

//------Location drop down
                Locations(
                  onTapOfLocation: (LocationList value) {
                    setState(() {
                      _selectedLocation = '${value?.id}';
                    });

                    print('Location from UI: $_selectedLocation');
                  },
                  PracticeIdList: _selectedPractice,
                ),

                SizedBox(height: 15),
//-----------text for provider
                Text(
                  AppStrings.treatingProvider,
                  style: TextStyle(
                    fontSize: 17,
                    color: CustomizedColors.accentColor,
                  ),
                ),
                SizedBox(height: 15),

//------Provider drop down
                ExternalProviderDropDown(
                  onTapOfProvider: (ProviderList value) {
                    _selectedProvider = '${value?.providerId}';

                    print('Provider from UI: $_selectedProvider');
                  },
                  PracticeLocationId: _selectedLocation,
                ),
                SizedBox(height: 15),
//----------label text
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
                  // height: 85,
                  width: MediaQuery.of(context).size.width * 0.80,
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //       color: CustomizedColors.primaryColor, width: 1.6),
                  // ),

//-------TextFeild for First Name
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: TextFormField(
                      validator: validateInput,
                      controller: _fName,
                      decoration: InputDecoration(
                        hintText: AppStrings.fName,

                        contentPadding: EdgeInsets.all(20),
                        // hintText: AppStrings.descp,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
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
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: CustomizedColors.primaryColor, width: 1.6)),
//-------TextFeild last name
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: TextFormField(
                      validator: validateInput,
                      controller: _lName,
                      decoration: InputDecoration(
                        hintText: AppStrings.lName,

                        contentPadding: EdgeInsets.all(20),
                        // hintText: AppStrings.descp,

                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CustomizedColors.accentColor),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
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

                DateOfBirth(
                  dobSelect: (dobvalue) {
                    currentDOB = dobvalue;

                    print('From UI:' + dobvalue);
                  },
                ),
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
//---------------date of Service Date Picker
                DateOfService(
                  dosSelect: (dosValue) {
                    currentDOS = dosValue;
                    print('From UI:' + dosValue);
                  },
                ),
                SizedBox(height: 15),
                Text(
                  AppStrings.documentType,
                  style: TextStyle(
                    fontSize: 17,
                    color: CustomizedColors.accentColor,
                  ),
                ),
                SizedBox(height: 15),
                DocumentDropDown(),

                SizedBox(height: 15),
                //----------------text for appointment type
                Text(
                  AppStrings.appointmentType,
                  style: TextStyle(
                    fontSize: 17,
                    color: CustomizedColors.accentColor,
                  ),
                ),
                SizedBox(height: 15),
//-----------------Appointment type Dropdown
                AppointmentDropDown(),
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

                Center(
                  child: ToggleSwitch(
                    minWidth: 160.0,
                    minHeight: 55,
                    cornerRadius: 10.0,
                    activeBgColor: CustomizedColors.accentColor,
                    activeFgColor: CustomizedColors.whiteColor,
                    inactiveBgColor: Colors.grey[300],
                    inactiveFgColor: Colors.grey[700],
                    labels: ['YES', 'NO'],
                    icons: [Icons.check_circle, Icons.cancel_rounded],
                    onToggle: (toggleIndex) {
                      // print('switched to: $toggleIndex');
                      if (toggleIndex == 0) {
                        toggleVal = 'YES';
                      } else if (toggleIndex == 1) {
                        toggleVal = 'NO';
                      } else {
                        return null;
                      }
                      print(toggleVal);
                    },
                  ),
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
                  // height: 150,
                  width: MediaQuery.of(context).size.width * 0.80,

//----------------TextFeild for description
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: TextFormField(
                      validator: validateInput,
                      controller: _descreiption,
                      minLines: 2,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: AppStrings.descp,

                        contentPadding: EdgeInsets.all(20),
                        // hintText: AppStrings.descp,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
//-----cupertino Action sheet
                CameraActionSheet(),
                SizedBox(height: 15),
//------raised Button for Submit with Dictation
                RaisedButtonCustom(
                  onPressed: () {
//---------Dialog box for Recorder
                    showDialog(
                        context: context,
                        builder: (ctxt) => AlertDialog(
                              title: Center(
                                  child: Text(AppStrings.alertDialogDictation)),
                              content: Container(
                                height: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
//-----------------material button for audio Recorder
                                    MaterialButton(
                                      onPressed: () {},
                                      shape: CircleBorder(),
                                      child: Icon(
                                        Icons.play_circle_outline,
                                        size: 65,
                                        color: CustomizedColors.accentColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
//-----------------material button inside dialog box
                                          Container(
                                            height: 45,
                                            width: 98,
                                            child: MaterialButton(
                                              child: Text(
                                                AppStrings.dialogCancel,
                                                style: TextStyle(
                                                    color: CustomizedColors
                                                        .whiteColor),
                                              ),
                                              color: CustomizedColors
                                                  .dialogCancelButton,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              elevation: 15,
                                              onPressed: () {
                                                Navigator.pop(ctxt);
                                              },
                                            ),
                                          ),
//-----------------material button inside dialog box
                                          Container(
                                            height: 45,
                                            width: 98,
                                            child: MaterialButton(
                                              child: Text(
                                                AppStrings.dialogSubmit,
                                                style: TextStyle(
                                                    color: CustomizedColors
                                                        .whiteColor),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              color:
                                                  CustomizedColors.accentColor,
                                              elevation: 15,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ));
                  },
                  text: AppStrings.submitwithDictButtonText,
                ),
                SizedBox(height: 15),
//------raised Button for Submitting
                RaisedButtonCustom(
                  onPressed: () {
                    print("$_selectedLocation");
                    print("$_selectedPractice");
                    print("$_selectedProvider");
                    print("$currentDOB");
                    print("$currentDOS");
                    print('$toggleVal');
                    print(_fName.text);
                    print(_lName.text);
                    print(_descreiption.text);
                    // print("$currentPractice");
                    //  print("$selectedDocumentType");
                    if (_formKey.currentState.validate()) {
// If the form is valid, display a snackbar. In the real world,
// you'd often call a server or save the information in a database.
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            backgroundColor: CustomizedColors.whiteColor,
                            valueColor: AlwaysStoppedAnimation(
                                CustomizedColors.accentColor),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('Submitting Data'),
                        ],
                      )));
                      _formKey.currentState.save();
                    }
                  },
                  text: AppStrings.submitButtonText,
                ),
                SizedBox(height: 15),
//------raised Button for clearing all the textediting controllers
                RaisedButtonCustom(
                  onPressed: () {
                    _formKey.currentState.reset();
                    _fName.clear();
                    _lName.clear();
                    _descreiption.clear();
                  },
                  text: AppStrings.clearAll,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validateInput(String value) {
    if (value.length == 0) {
      return 'This is required';
    } else {
      return null;
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
