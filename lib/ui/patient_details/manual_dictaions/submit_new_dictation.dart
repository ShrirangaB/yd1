// import 'dart:ffi';
import 'dart:io';

import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_log_helper.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:YOURDRS_FlutterAPP/network/models/appointment_type.dart';
import 'package:YOURDRS_FlutterAPP/network/models/dictation.dart';
import 'package:YOURDRS_FlutterAPP/network/models/document_type.dart';
import 'package:YOURDRS_FlutterAPP/network/models/external_dictation_attachment.dart';
import 'package:YOURDRS_FlutterAPP/network/models/location_field_model.dart';
import 'package:YOURDRS_FlutterAPP/network/models/photo_list.dart';
import 'package:YOURDRS_FlutterAPP/network/models/practice.dart';
import 'package:YOURDRS_FlutterAPP/network/models/provider_model.dart';
import 'package:YOURDRS_FlutterAPP/network/services/external_dictation_attachment_service.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/mic_button.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/cupertino_action_sheet.dart';
import 'package:YOURDRS_FlutterAPP/widget/dateofbirthpicker.dart';
import 'package:YOURDRS_FlutterAPP/widget/dateofservicepicker.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/appointmenttype.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/documenttype.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/location_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/practice_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dropdowns/provider_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

//import 'package:searchable_dropdown/searchable_dropdown.dart';

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
  var statusCode;
  String _selectedLocationName;
  String _selectedPracticeName;
  String _selectedProviderName;
  String _selectedPracticeId;
  String _selectedLocationId;
  String _selectedProvider;
  int _selectedDoc;
  String _selectedDocName;
  int _selectedAppointment;
  String _selectedAppointmentName;
  String currentDOB;
  String currentDOS;
  String _imgPath;
  int toggleVal;
  File image;
  bool widgetVisible = false;
  bool visible = false;
  Directory directory;
  bool isSwitched = false;
  List imageArray = [];
  //File image;
  int gIndex;
  String path;
  String fileName;
  String filepath;
  String venky;
  Map<String, String> paths;
  List<String> extensions;
  bool isLoadingPath = false;
  bool isMultiPick = false;
  FileType fileType;
  bool imageVisible = true;

  final DateFormat formatter = DateFormat(AppStrings.dateFormat);

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
                      _selectedPracticeId = '${pValue?.id}';
                      _selectedPracticeName = pValue.name;
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
                  onTapOfLocation: (LocationList value) async {
                    setState(() {
                      _selectedLocationId = '${value?.id}';
                    });
                    _selectedLocationName = value.name;
                  },
                  PracticeIdList: _selectedPracticeId,
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
                  onTapOfProvider: (ProviderList value) async {
                    _selectedProvider = '${value?.providerId}';
                    _selectedProviderName = value.displayname;
                  },
                  PracticeLocationId: _selectedLocationId,
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
                  width: MediaQuery.of(context).size.width * 0.98,
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
                  width: MediaQuery.of(context).size.width * 0.98,
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: CustomizedColors.primaryColor, width: 1.6)),
//-------TextFeild last name
                  child: Container(
                    width: MediaQuery.of(context).size.width * 95,
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
                DocumentDropDown(
                  onTapDocument: (ExternalDocumentTypesList value) async {
                    _selectedDoc = value.id;

                    _selectedDocName = value.externalDocumentTypeName;
                  },
                  //  selectedDocumentType: null,
                ),

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
                AppointmentDropDown(
                  onTapOfAppointment: (AppointmentTypeList value) async {
                    _selectedAppointment = value.id;
                    _selectedAppointmentName = value.name;
                  },
                  //selectedAppointmentType: _selectedAppointment,
                ),
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
                    labels: [AppStrings.toggleYES, AppStrings.toggleNO],
                    icons: [Icons.check_circle, Icons.cancel_rounded],
                    onToggle: (toggleIndex) {
                      if (toggleIndex == 0) {
                        toggleVal = 1;
                      } else if (toggleIndex == 1) {
                        toggleVal = 0;
                      } else {
                        return null;
                      }
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
                  width: MediaQuery.of(context).size.width * 0.95,

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
                //------------visibility
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
                                      color: CustomizedColors
                                          .signInButtonTextColor,
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
                //-----------------visibility
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
                                        color:
                                            CustomizedColors.homeSubtitleColor,
                                      ),
                                    ),
                                    //   padding: const EdgeInsets.only(bottom: 30.0),
                                    height: 100,
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: new ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          paths != null && paths.isNotEmpty
                                              ? paths.length
                                              : 1,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        final bool isMultiPath =
                                            paths != null && paths.isNotEmpty;
                                        final filePath1 = isMultiPath
                                            ? paths.values
                                                .toList()[index]
                                                .toString()
                                            : filepath;
                                        print(filePath1);
                                        return Container(
                                          color: CustomizedColors
                                              .homeSubtitleColor,
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
                                                        paths.values
                                                            .toList()[index]);
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
                    ],
                  ),
                ),
//-----cupertino Action sheet
                RaisedButton(
                  color: CustomizedColors.whiteColor,
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

                              MicButton(
                                practiceName: _selectedPracticeName,
                                practiceId: int.parse(_selectedPracticeId),
                                locationName: _selectedLocationName,
                                locationId: int.parse(_selectedLocationId),
                                providerName: _selectedProviderName,
                                providerId: int.parse(_selectedProvider),
                                patientFName: _fName.text,
                                patientLName: _lName.text,
                                patientDob: currentDOB,
                                patientDos: currentDOS,
                                docType: _selectedDoc,
                                appointmentType: _selectedAppointment,
                                emergency: toggleVal,
                                descp: _descreiption.text,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(11),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
//-----------------material button inside dialog box
                                    Container(
                                      height: 45,
                                      width: 98,
                                      child: MaterialButton(
                                        child: Text(
                                          AppStrings.dialogCancel,
                                          style: TextStyle(
                                              color:
                                                  CustomizedColors.whiteColor),
                                        ),
                                        color:
                                            CustomizedColors.dialogCancelButton,
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
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  text: AppStrings.submitwithDictButtonText,
                ),
                SizedBox(height: 15),
//------raised Button for Submitting
                RaisedButtonCustom(
                  onPressed: () async {
                    print(
                        '***************************************************************');
                    print(_imgPath);

                    try {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
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
                            ),
                          ),
                        );
                        DatabaseHelper.db.insertAudioRecords(
                          PatientDictation(
                            attachmentType: '.mp4',
                            locationName: _selectedLocationName ?? "",
                            locationId: int.parse(_selectedLocationId) ?? "",
                            practiceName: _selectedPracticeName ?? "",
                            practiceId: int.parse(_selectedPracticeId) ?? "",
                            providerName: _selectedProviderName ?? "",
                            providerId: int.parse(_selectedProvider) ?? "",
                            patientFirstName: _fName.text ?? "",
                            patientLastName: _lName.text ?? "",
                            patientDOB: currentDOB ?? "",
                            dos: currentDOS ?? "",
                            isEmergencyAddOn: toggleVal ?? "",
                            externalDocumentTypeId: _selectedDoc ?? "",
                            appointmentTypeId: _selectedAppointment ?? "",
                            description: _descreiption.text ?? "",
                          ),
                        );

                        DatabaseHelper.db.insertPhotoList(
                          PhotoList(
                            fileName: paths ?? "",
                          ),
                        );
                        // final String formatted = formatter.format(now);

                        // DatabaseHelper.db.insertPhotoList(PhotoList(
                        //     attachmentname:
                        //         '${item.patient.displayName ?? ''}' +
                        //             "_" +
                        //             '${formatted}' +
                        //             '_' +
                        //             basename('${image}') +
                        //             "_",
                        //     createddate: '${DateTime.now()}',
                        //     attachmenttype: AppStrings.imageFormat,
                        //     physicalfilename: '${image.path}'));
                      }
                    } on Exception catch (e) {
                      print(e.toString());
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

                ///-----------------------Post to API button
                RaisedButtonCustom(
                  onPressed: () async {
                    await saveAttachmentDictation();
                  },
                  text: 'Post to APi',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  String validateInput(String value) {
    try {
      if (value.length == 0) {
        return 'This is required';
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  ///---------------to open cupertino action sheet
  _show(BuildContext ctx) {
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
    String path = image.path;
    createFileName(path);
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
            allowedExtensions: extensions,
            allowCompression: true);

        print(paths);

        // return paths.values.toList();
      } else {
        filepath = await FilePicker.getFilePath(
            type: fileType != null ? fileType : FileType.image,
            allowedExtensions: extensions,
            allowCompression: true);

        print(filepath);

        paths = null;
      }
    } on PlatformException catch (e) {
      print("file not found" + e.toString());
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

  Future<String> createFileName(String mockName) async {
    String fileName1;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat(AppStrings.dateFormat);
    final String formatted = formatter.format(now);
    try {
      fileName1 = AppStrings.name + basename(mockName).replaceAll(".", "");
      if (fileName1.length > AppStrings.name.length) {
        fileName1 = fileName1.substring(0, AppStrings.name.length);
        final Directory directory = await getExternalStorageDirectory();
        path = '${directory.path}/${AppStrings.folderName}';
        final myImgDir = await Directory(path).create(recursive: true);
        final File newImage = await image.copy(
            '${myImgDir.path}/${basename(fileName1 + '${formatted}' + AppStrings.imageFormat)}');
        setState(() {
          newImage;
          print(path);
        });
      }
    } catch (e, s) {
      fileName1 = "";
      AppLogHelper.printLogs(e, s);
    }

    print("${formatted}" + fileName1 + ".jpeg");
    return "${formatted}" + fileName1 + ".jpeg";
  }

  saveAttachmentDictation() async {
    try {
      ExternalDictationAttachment apiAttachmentPostServices =
          ExternalDictationAttachment();
      SaveExternalDictationOrAttachment saveDictationAttachments =
          await apiAttachmentPostServices.postApiServiceMethod(
              int.parse(_selectedPracticeId),
              int.parse(_selectedLocationId),
              int.parse(_selectedProvider),
              _fName.text,
              _lName.text,
              currentDOB,
              currentDOS,
              _selectedDoc,
              _selectedAppointment,
              toggleVal,
              _descreiption.text);
      statusCode = saveDictationAttachments?.header?.statusCode;
      //printing status code
      print("status $statusCode");
    } catch (e) {
      print('SaveAttachmentDictation exception ${e.toString()}');
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// SaveDictations() async {
//   try {
//     PostDictationsService apiPostServices = PostDictationsService();
//     PostDictationsModel saveDictations = await apiPostServices.postApiMethod(
//         int.parse(memberId),
//         dob,
//         int.parse(id),
//         int.parse(dictationId),
//         int.parse(episodId),
//         int.parse(episodeAppointmentRequestId));
//     data = saveDictations?.header?.statusCode; //.ptinting status code
//     print("status $data");
//   } catch (e) {
//     print('SaveDictations exception ${e.toString()}');
//   }
// }
