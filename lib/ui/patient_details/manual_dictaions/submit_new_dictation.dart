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
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitNewDictation extends StatefulWidget {
  @override
  _SubmitNewDictationState createState() => _SubmitNewDictationState();
}

class _SubmitNewDictationState extends State<SubmitNewDictation> {
  TextvalidBloc _bloc;
  final _fName = TextEditingController();
  final _lName = TextEditingController();
  // final dateOfBirth = TextEditingController();
  // final dateOfService = TextEditingController();
  final _descreiption = TextEditingController();

  var _currentSelectedValue;

  List<bool> _isSelected = [true, false];

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  void initState() {
    this._bloc = TextvalidBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (context) => TextvalidBloc(),
        child: BlocBuilder<TextvalidBloc, TextvalidState>(
          //bloc: this._bloc,
          builder: (context, state) {
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
                    child: TextField(
                      controller: _fName,
                      decoration: InputDecoration(
                        hintText: AppStrings.fName,
                        hintStyle: TextStyle(
                          color: this._hasfNameError(state)
                              ? Colors.red
                              : Colors.black,
                        ),
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
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: CustomizedColors.primaryColor, width: 1.6)),
//-------TextFeild last name
                    child: TextField(
                      controller: _lName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
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
//                   Container(
//                       width: MediaQuery.of(context).size.width * 0.80,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: CustomizedColors.primaryColor,
//                               width: 1.6)),
// //-------TextFeild for date of Birth
//                       child: TextField(
//                         controller: dateOfBirth,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       )),
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
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.80,
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                             color: CustomizedColors.primaryColor, width: 1.6)),
// //-------TextFeild for Date of Service
//                     child: TextField(
//                       controller: dateOfService,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
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
                    // height: 150,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: CustomizedColors.primaryColor, width: 1.6)),
//-------TextFeild
                    child: TextField(
                      controller: _descreiption,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
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
                    onPressed: () => this._bloc.add(TextvalidEventSubmit(
                        this._fName.text,
                        this._lName.text,
                        this._descreiption.text)),
                    text: AppStrings.submitButtonText,
                  ),
                  SizedBox(height: 15),
//------raised Button for clearing all the textediting controllers
                  RaisedButtonCustom(
                    onPressed: () {
                      _fName.clear();
                      _lName.clear();
                      _descreiption.clear();
                    },
                    text: AppStrings.clearAll,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool _hasfNameError(TextvalidState state) => state.fNameError != null;

  // String _fNameErrorText(FieldError error) {
  //   switch (error) {
  //     case FieldError.Empty:
  //       return 'Enter Name';
  //     case FieldError.Invalid:
  //       return 'Cannot be Empty';
  //     default:
  //       return '';
  //   }
  // }

  bool _haslNameError(TextvalidState state) => state.lNameError != null;

  // String _lNameErrorText(FieldError error) {
  //   switch (error) {
  //     case FieldError.Empty:
  //       return 'Enter text';
  //     case FieldError.Invalid:
  //       return 'Cannot be Empty';
  //     default:
  //       return '';
  //   }
  // }
}
