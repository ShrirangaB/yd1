import 'dart:convert';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/network/models/appointment.dart';
import 'package:YOURDRS_FlutterAPP/network/models/appointment_type.dart';
import 'package:YOURDRS_FlutterAPP/network/models/document_type.dart';
import 'package:YOURDRS_FlutterAPP/network/models/location.dart';
import 'package:YOURDRS_FlutterAPP/network/models/provider.dart';
import 'package:http/http.dart' as http;

class Services {
//   static const String url = 'https://jsonplaceholder.typicode.com/users';

// //getUsers service method
//   static Future<List<Patient>> getUsers() async {
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<Patient> list = parseUsers(response.body);
//         return list;
//       } else {
//         throw Exception("Error");
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   static List<Patient> parseUsers(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<Patient>((json) => Patient.fromJson(json)).toList();
//   }

//   //getLocation service method//

//   Future<Location> getLocation() async {
//     try {
//       var endpointUrl = ApiUrlConstants.getLocation;
//       Map<String, String> queryParams = {
//         'MemberId': '1',
//       };
//       String queryString = Uri(queryParameters: queryParams).query;
//       var requestUrl = endpointUrl + '?' + queryString;
//       final response = await http.get(Uri.encodeFull(requestUrl),
//           headers: {"Accept": "application/json"});
//       if (response.statusCode == 200) {
//         Location location = parseLocation(response.body);
//         // print(list);
//         return location;
//       } else {
//         throw Exception("Error");
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   static Location parseLocation(String responseBody) {
//     final Location location = Location.fromJson(json.decode(responseBody));
//     return location;
//   }

// //getProviders service
//   Future<Provider> getProviders() async {
//     try {
//       var endpointUrl = ApiUrlConstants.getProviders;
//       Map<String, String> queryParams = {
//         'MemberId': '1',
//       };
//       String queryString = Uri(queryParameters: queryParams).query;
//       var requestUrl = endpointUrl + '?' + queryString;
//       final response = await http.get(Uri.encodeFull(requestUrl),
//           headers: {"Accept": "application/json"});
//       if (response.statusCode == 200) {
//         Provider provider = parseProviders(response.body);
//         // print(list);
//         return provider;
//       } else {
//         throw Exception("Error");
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   static Provider parseProviders(String responseBody) {
//     final Provider provider = Provider.fromJson(json.decode(responseBody));
//     return provider;
//   }

  Future<Documenttype> getDocumenttype() async {
    try {
      var endpointUrl = ApiUrlConstants.getDocumenttype;
      // Map<String, String> queryParams = {
      //   'LoggedInMemberId': '1','PracticeIdList': '1',
      // };
      //String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl;
      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        Documenttype document = parseLocation(response.body);
        // print(data);
        return document;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Documenttype parseLocation(String responseBody) {
    final Documenttype document =
        Documenttype.fromJson(json.decode(responseBody));
    return document;
  }

  ///-----------------appointment type
  Future<AppointmentType> getAppointmenttype() async {
    try {
      var endpointUrl = ApiUrlConstants.getAppointmenttype;
      var requestUrl = endpointUrl;
      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        AppointmentType appointment = parseAppointment(response.body);
        return appointment;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static AppointmentType parseAppointment(String responsebody) {
    final AppointmentType appointment =
        AppointmentType.fromJson(json.decode(responsebody));
    return appointment;
  }

  // postApiMethod() async {
  //   String apiUrl = ApiUrlConstants.getSchedules;

  //   final json = {
  //     "memberId": 1,
  //     "appointmentStartDate": "2021-03-02T10:53:13.748Z",
  //     "appointmentEndDate": "2021-03-02T10:53:13.748Z",
  //     "locationId": 0,
  //     "patientSearchString": null,
  //     "dictationStatusId": 0,
  //     "providerId": 0,
  //     "page": 0
  //   };

  //   http.Response response = await http.post(apiUrl, body: json);

  //   var jsonResponse = jsonDecode(response.body);
  //   print(jsonResponse);
  // }
}
