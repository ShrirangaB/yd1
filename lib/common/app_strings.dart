import 'package:YOURDRS_FlutterAPP/common/app_constants.dart';

class AppStrings {
  static const welcome = 'Welcome';
  static const signIn = "Signin";
  static const tryAgain = "tryAgain";
  static const notNow = "notNow";

  //team 3
  static const appBarTitle = 'Manual Dictations';
  static const tabSubmitNew = 'Submit New';
  static const tabAllDictation = 'All Dictations';
  static const practice = 'Practice';
  static const location = 'Location';
  static const treatingProvider = 'Treating Provider';
  static const documentType = 'Document Type';
  static const appointmentType = 'Appointment Type';
  static const descp = 'Description';
  static const allDictation = 'All Dictations';
  static const submitButtonText = 'Submit';
  static const submitwithDictButtonText = 'Submit with Dictation';
  static const clearAll = 'Clear All';
  static const emergencyText = 'Is emergency add on desctription?';
  static const fName = 'First Name';
  static const lName = 'Last Name';
  static const dobDropDownText = 'Date of Birth';
  static const dosDropDownText = 'Date of Service';
  static const alertDialogDictation = 'Dictation';
  static const dialogSubmit = 'Submit';
  static const dialogCancel = 'Cancel';
}

class ApiUrlConstants {
  // for getting Locations//
  static const getLocation =
      AppConstants.dioBaseUrl + "api/Schedule/GetMemberLocations";
  // for getting Provider
  static const getProviders =
      AppConstants.dioBaseUrl + "api/Schedule/GetAssociatedProvider";
  //for getting Schedules
  static const getSchedules =
      AppConstants.dioBaseUrl + "api/Schedule/GetSchedules";
}
