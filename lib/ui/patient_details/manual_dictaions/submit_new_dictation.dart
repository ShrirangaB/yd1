import 'package:YOURDRS_FlutterAPP/blocs/textbloc/textvalid_bloc.dart';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/cupertino_action_sheet.dart';
import 'package:YOURDRS_FlutterAPP/widget/dateofbirthpicker.dart';
import 'package:YOURDRS_FlutterAPP/widget/dateofservicepicker.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/appointmenttype.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/dictation.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/documenttype.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/location.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/practise.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/provider.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SubmitNewDictation extends StatefulWidget {
  @override
  _SubmitNewDictationState createState() => _SubmitNewDictationState();
}

class _SubmitNewDictationState extends State<SubmitNewDictation> {
  final _formKey = GlobalKey<FormState>();
  final _fName = TextEditingController();
  final _lName = TextEditingController();
  final _descreiption = TextEditingController();

  var _currentSelectedValue;

  List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
//---------ListView for the scrolling body
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              //-----------text for Practise
              Text(
                AppStrings.practice,
                style: TextStyle(
                  fontSize: 17,
                  color: CustomizedColors.accentColor,
                ),
              ),
//------Practise drop down
              // Practise(),
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
              LocationDropDown(),
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
              ProviderDropDowns(),
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
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
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
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  controller: _lName,
                  decoration: InputDecoration(
                    hintText: AppStrings.lName,

                    contentPadding: EdgeInsets.all(20),
                    // hintText: AppStrings.descp,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
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

              DateOfBirth(),
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

              DateOfService(),
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
              // ToggleButtons(
              //   children: <Widget>[Text('Yes'), Text('No')],
              //   isSelected: _isSelected,
              //   onPressed: (int index) {
              //     setState(() {
              //       _isSelected[index] = !_isSelected[index];
              //     });
              //   },
              // ),
              Center(
                child: ToggleSwitch(
                  minWidth: 130.0,
                  minHeight: 45,
                  cornerRadius: 10.0,
                  activeBgColor: CustomizedColors.accentColor,
                  activeFgColor: CustomizedColors.whiteColor,
                  inactiveBgColor: Colors.grey[300],
                  inactiveFgColor: CustomizedColors.inactiveFgColorCustom,
                  labels: ['YES', 'NO'],
                  icons: [Icons.check_circle, Icons.cancel_rounded],
                  onToggle: (toggleIndex) {
                    print('switched to: $toggleIndex');
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
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
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
                                                    BorderRadius.circular(15)),
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
                                                    BorderRadius.circular(15)),
                                            color: CustomizedColors.accentColor,
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
                onPressed: () {},
                text: AppStrings.submitButtonText,
              ),
              SizedBox(height: 15),
//------raised Button for clearing all the textediting controllers
              RaisedButtonCustom(
                onPressed: () {
                  _fName.clear();
                  _lName.clear();
                  _descreiption.clear();
                  _currentSelectedValue.clear();
                },
                text: AppStrings.clearAll,
              )
            ],
          ),
        ),
      ),
    );
  }
}
