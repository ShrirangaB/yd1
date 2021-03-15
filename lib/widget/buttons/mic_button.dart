import 'package:YOURDRS_FlutterAPP/blocs/dictation_screen/audio_dictation_bloc.dart';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/audio_dictation.dart';

import 'package:YOURDRS_FlutterAPP/widget/buttons/dropdowns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MicButton extends StatefulWidget {
  final String patientFName,
      patientLName,
      patientDob,
      patientDos,
      dictationTypeId,
      caseNum,
      docType,
      appointmentType,
      practiceName,
      providerName,
      locationName,
      descp;
  final int practiceId, providerId, locationId;
  final bool emergency;
  const MicButton(
      {Key key,
      this.patientFName,
      this.patientLName,
      this.patientDob,
      this.patientDos,
      this.dictationTypeId,
      this.docType,
      this.appointmentType,
      this.caseNum,
      this.practiceName,
      this.providerName,
      this.locationName,
      this.emergency,
      this.descp,
      this.practiceId,
      this.providerId,
      this.locationId})
      : super(key: key);
  @override
  _MicButtonState createState() => _MicButtonState();
}

class _MicButtonState extends State<MicButton> {
  var _currentSelectedValue;
  var _currencies = [
    "Surgery",
    "Non-Surgery",
    "MRI",
    "Operative",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FlatButton(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 100),
      onPressed: () {
        Alert(
          context: context,
          title: "Select a Dictation Type",
          content: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 10),
              color: CustomizedColors.alertColor,
              height: height * 0.09,
              width: width * 0.65,
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  /// calling the drop down button widget from widget folder
                  return DropDown(
                    value: _currentSelectedValue,
                    hint: "Dictation Type",
                    onChanged: (String newValue) {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: height * 0.50,
                            child: BlocProvider<AudioDictationBloc>(
                              create: (context) => AudioDictationBloc(),

                              /// calling the audio dictation class from ui folder
                              child: AudioDictation(
                                practiceName: null,
                                locationName: null,
                                providerName: null,
                                patientFName: null,
                                patientLName: null,
                                patientDob: null,
                                patientDos: null,
                                docType: null,
                                appointmentType: null,
                                emergency: null,
                                descp: null,
                              ),
                            ),
                          );
                        },
                      );
                      setState(() {
                        _currentSelectedValue = newValue;
                        state.didChange(newValue);
                      });
                    },
                    items: _currencies.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                },
              )),
          buttons: [
            DialogButton(
              color: CustomizedColors.alertCancelColor,
              child: Text(
                "Cancel",
                style:
                    TextStyle(color: CustomizedColors.textColor, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: CustomizedColors.circleAvatarColor,
            borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.mic,
          color: CustomizedColors.micIconColor,
          size: 40,
        ),
      ),
    );
  }
}
