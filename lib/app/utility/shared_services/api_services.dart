// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

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

  DateTime createdAt;
  String titleAr;
  String titleEn;
  String contentAr;
  String contentEn;
  String image;
  String id;

  factory News.fromJson(Map<String, dynamic> json) => News(
        createdAt: DateTime.parse(json["createdAt"]),
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        contentAr: json["content_ar"],
        contentEn: json["content_en"],
        image: json["image"],
        id: json["id"],
      );
}
