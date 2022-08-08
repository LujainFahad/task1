import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/enum.dart';

class Helpers {
  static String translatingWord(String key) => key.tr();
  static List<String> getListOfAppLanguages() =>
      Constants.Default_App_Lang == App_Supported_Lang.AR
          ? <String>['ar', 'en']
          : <String>['en', 'ar'];

  static bool isArabic(BuildContext context) =>
      translator.isDirectionRTL(context);
}
