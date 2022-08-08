import 'package:flutter/material.dart';
import 'package:trainee_task/app/utility/enum.dart';

class SideMenuLangModel {
  final App_Supported_Lang? langCode;

  SideMenuLangModel({
    @required this.langCode,
  });

  factory SideMenuLangModel.fromJson(Map<String, dynamic> json) =>
      SideMenuLangModel(
          langCode: _convertStringToEnumLanguage(json["lang_code"]));

  Map<String, dynamic> toJson() =>
      {"lang_code": _convertEnumLanguageToString(langCode!)};

  String _convertEnumLanguageToString(App_Supported_Lang enumValue) =>
      enumValue.toString();

  static App_Supported_Lang _convertStringToEnumLanguage(String value) =>
      App_Supported_Lang.values.firstWhere(
        (status) => status.toString() == value,
      );
}
