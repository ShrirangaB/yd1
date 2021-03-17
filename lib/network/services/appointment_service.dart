import 'dart:convert';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';

import 'package:YOURDRS_FlutterAPP/network/models/appointment_type.dart';
import 'package:YOURDRS_FlutterAPP/network/models/dictations_model.dart';
import 'package:YOURDRS_FlutterAPP/network/models/document_type.dart';

import 'package:YOURDRS_FlutterAPP/network/models/location_field_model.dart';
import 'package:YOURDRS_FlutterAPP/network/models/practice.dart';
import 'package:YOURDRS_FlutterAPP/network/models/provider_model.dart';

import 'package:http/http.dart' as http;

class Services {
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

  ///------------Practice service method

  Future<Practices> getPratices() async {
    try {
      var endpointUrl = ApiUrlConstants.getPractices;
      Map<String, String> queryParams = {
        'LoggedInMemberId': '1',
      };
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        Practices practice = parsePractices(response.body);
        // print(data);
        return practice;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Practices parsePractices(String responseBody) {
    final Practices practice = Practices.fromJson(json.decode(responseBody));
    return practice;
  }

  ///-------------Location service method
  Future<ExternalLocation> getExternalLocation(String PracticeIdList) async {
    try {
      var endpointUrl = ApiUrlConstants.getExternalLocation;
      Map<String, String> queryParams = {
        'LoggedInMemberId': '1',
        'PracticeIdList': '$PracticeIdList',
      };
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        ExternalLocation externalLocation =
            parseExternalLocation(response.body);
        // print(data);
        return externalLocation;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static ExternalLocation parseExternalLocation(String responseBody) {
    final ExternalLocation externalLocation =
        ExternalLocation.fromJson(json.decode(responseBody));
    return externalLocation;
  }

  //------------------Providers service
  Future<ExternalProvider> getExternalProvider(
      String PracticeLocationId) async {
    print('getExternalProvider PracticeLocationId $PracticeLocationId');
    if (PracticeLocationId != null) {
      try {
        var endpointUrl =
            ApiUrlConstants.getProvidersforSelectedPracticeLocation;
        Map<String, String> queryParams = {
          'LoggedInMemberId': '1',
          'PracticeLocationId': '$PracticeLocationId',
        };
        String queryString = Uri(queryParameters: queryParams).query;
        var requestUrl = endpointUrl + '?' + queryString;
        final response = await http.get(Uri.encodeFull(requestUrl),
            headers: {"Accept": "application/json"});
        if (response.statusCode == 200) {
          ExternalProvider externalProvider =
              parseExternalProvider(response.body);
          // print(data);
          return externalProvider;
        } else {
          throw Exception("Error");
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    }

    return null;
  }

  static ExternalProvider parseExternalProvider(String responseBody) {
    final ExternalProvider externalProvider =
        ExternalProvider.fromJson(json.decode(responseBody));
    return externalProvider;
  }

  /// Get all dictations api service class
  Future<Dictations> getDictations() async {
    try {
      var endpointUrl = ApiUrlConstants.dictations;
      Map<String, dynamic> queryParams = {
        'TranscriptionId': '5753',
        'AppointmentId': '34533',
      };

      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      print('requestUrl $requestUrl');

      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      print('response' + response.body);

      if (response.statusCode == 200) {
        Dictations allDictations = parseAllDictations(response.body);
        print('dictations-- $allDictations');
        return allDictations;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Dictations parseAllDictations(String responseBody) {
    final Dictations allDictations =
        Dictations.fromJson(json.decode(responseBody));
    print(allDictations);
    return allDictations;
  }

  
}
