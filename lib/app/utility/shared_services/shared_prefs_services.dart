import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/enum.dart';
import 'package:trainee_task/app/utility/shared_services/json_coder.dart';
import 'package:trainee_task/app/widgets/side_menu/models/side_menu_lang_model.dart';

class SharedPrefsServices {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;

    await setLang(
      SideMenuLangModel(
        langCode: App_Supported_Lang.AR,
      ),
    );

    return _prefsInstance!;
  }

  static Future<bool?>? checkLang() async {
    return _prefsInstance!.containsKey(Constants.SHARED_PREFS_APP_SETTINGS_KEY);
  }

  static Future<bool?>? setLang(SideMenuLangModel langSetting) async {
    final encodedAppSettingsValue = JsonCoder.modelToJson(langSetting.toJson());
    final checkExistsKkey = await checkAppSettings();
    if (!checkExistsKkey!) {
      return _prefsInstance!.setString(
        Constants.SHARED_PREFS_APP_SETTINGS_KEY,
        encodedAppSettingsValue,
      );
    }
  }

  static Future<bool?>? checkAppSettings() async {
    return _prefsInstance!.containsKey(Constants.SHARED_PREFS_APP_SETTINGS_KEY);
  }

  static Future<App_Supported_Lang?>? getAppLanguageSettings() async {
    final checkExistsKkey = await checkAppSettings();
    if (checkExistsKkey!) {
      final appSettingsEncodedValue = _prefsInstance!.getString(
        Constants.SHARED_PREFS_APP_SETTINGS_KEY,
      );
      final decodedAppSettingsValue = JsonCoder.modelFromJson(
        appSettingsEncodedValue!,
      );
      final appSettings = SideMenuLangModel.fromJson(
        decodedAppSettingsValue,
      );
      return appSettings.langCode;
    } else {
      return Constants.Default_App_Lang; // default-language
    }
  }

  static Future<SideMenuLangModel?>? updateAppLanguageSettings(
    App_Supported_Lang langCode,
  ) async {
    final checkExistsKkey = await checkAppSettings();
    if (checkExistsKkey!) {
      final appSettingsEncodedValue = _prefsInstance!.getString(
        Constants.SHARED_PREFS_APP_SETTINGS_KEY,
      );
      final decodedAppSettingsValue = JsonCoder.modelFromJson(
        appSettingsEncodedValue!,
      );
      final appSettings = SideMenuLangModel.fromJson(
        decodedAppSettingsValue,
      );
      final updatedAppSettings = SideMenuLangModel(
        langCode: langCode,
      );
      final encodedAppSettingsValue = JsonCoder.modelToJson(
        updatedAppSettings.toJson(),
      );
      _prefsInstance!.setString(
        Constants.SHARED_PREFS_APP_SETTINGS_KEY,
        encodedAppSettingsValue,
      );
      return updatedAppSettings;
    } else {
      final newAppSettings = SideMenuLangModel(
        langCode: langCode,
      );
      final encodedNewAppSettingsValue = JsonCoder.modelToJson(
        newAppSettings.toJson(),
      );
      _prefsInstance!.setString(
        Constants.SHARED_PREFS_APP_SETTINGS_KEY,
        encodedNewAppSettingsValue,
      );
      return newAppSettings;
    }
  }

  static Future<bool?>? deleteAppSettings() async {
    final checkExistsKkey = await checkAppSettings();
    if (checkExistsKkey!) {
      return _prefsInstance!.remove(
        Constants.SHARED_PREFS_APP_SETTINGS_KEY,
      );
    } else {
      return Future.value(false);
    }
  }
}
