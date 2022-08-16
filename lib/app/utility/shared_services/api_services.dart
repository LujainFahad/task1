import 'dart:convert';

import 'package:http/http.dart';
import 'package:trainee_task/app/utility/shared_services/api_urls.dart';

class News {
  News({
    required this.createdAt,
    required this.titleAr,
    required this.titleEn,
    required this.contentAr,
    required this.contentEn,
    required this.image,
    required this.id,
  });

  String createdAt;
  String titleAr;
  String titleEn;
  String contentAr;
  String contentEn;
  String image;
  String id;

  factory News.fromJson(Map<String, dynamic> json) => News(
        createdAt: json["createdAt"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        contentAr: json["content_ar"],
        contentEn: json["content_en"],
        image: json["image"],
        id: json["id"],
      );
}

class ContactAPI {
  String firstName;
  String lastName;
  String email;
  String mobile;
  String messageTitle;
  String messageType;
  String messageDesc;
  String? attachment;

  ContactAPI(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.mobile,
      required this.messageTitle,
      required this.messageType,
      required this.messageDesc,
      this.attachment});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'email': email,
  //     'mobile': mobile,
  //     'messageTitle': messageTitle,
  //     'messageType': messageType,
  //     'messageDesc': messageDesc,
  //     'attachment': attachment,
  //   };
  // }

  // factory ContactAPI.fromMap(Map<String, dynamic> map) {
  //   return ContactAPI(
  //     map['firstName'] ?? '',
  //     map['lastName'] ?? '',
  //     map['email'] ?? '',
  //     map['mobile'] ?? '',
  //     map['messageTitle'] ?? '',
  //     map['messageType'] ?? '',
  //     map['messageDesc'] ?? '',
  //     map['attachment'] ?? '',
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory ContactAPI.fromJson(String source) =>
  //     ContactAPI.fromMap(json.decode(source));
}
