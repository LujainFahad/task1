import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:trainee_task/app/utility/shared_services/api_urls.dart';

class Helpers {
  static bool isArabic(BuildContext context) =>
      translator.isDirectionRTL(context);
  static bool get isAr => translator.activeLanguageCode == 'ar';

  static String getDateFormat(String date) {
    return DateFormat('dd MMMM yyyy', translator.activeLanguageCode)
        .format(DateTime.parse(date));
  }

  static Widget contactField(
    context,
    String lable,
    var controller,
  ) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          style: const TextStyle(
            color: AppColors.main,
            fontSize: 15,
          ),
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.grey[100],
            hintText: lable,
          ),
          cursorColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
