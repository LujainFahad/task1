import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trainee_task/app/utility/shared_services/api_response.dart';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:trainee_task/app/utility/shared_services/api_urls.dart';

class NewsRepository {
  static String mainUrl = APIURLs.DOMAIN;
  final http.Client client;

  NewsRepository(this.client);

  Future<NewsResponse> getContent(int n) async {
    try {
      final headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
      };
      final url = mainUrl.replaceAll('{n}', n.toString());
      final response = await client.get(getUri(url), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        return NewsResponse.fromList(data);
      } else {
        throw Exception('Something Went Wrong');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Uri getUri(String url) {
    return Uri.parse(url);
  }
}

abstract class ContactRepository {
  Future<ContactAPI> fetchDetails(
    String firstName,
    String lastName,
    String email,
    String mobile,
    String messageTitle,
    String messageType,
    String messageDesc,
    String? attachment,
  );
}

// class ContactRepo extends ContactRepository {
//   @override
//   Future<ContactAPI> fetchDetails(
//     String firstName,
//     String lastName,
//     String email,
//     String mobile,
//     String messageTitle,
//     String messageType,
//     String messageDesc,
//     String? attachment,
//   ) async {
//     final response = await http.post(Uri.parse(APIURLs.CONTACTUS), body: {
//       'firstName': firstName,
//       'lastName': lastName,
//       'email': email,
//       'mobile': mobile,
//       'messageTitle': messageTitle,
//       'messageType': messageType,
//       'messageDesc': messageDesc,
//       'attachment': attachment,
//     });

//     if (response.statusCode == 201) {
//       return ContactAPI.fromJson(response.body);
//     } else {
//       debugPrint("ERROR IN API CALL ${response.statusCode}");
//       throw Exception('Failed to load API data');
//     }
//   }
// }
