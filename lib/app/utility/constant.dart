import 'dart:convert';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:http/http.dart' as http;

class Constants {
  static const String App_Lang_Path = 'assets/lang/';

  static const String splash_icon_path = 'assets/icons/splash_icon.svg';
  static const String spl_icon_path = 'assets/icons/5TRrpRAGc.png';
  static const String nav_icon_path = 'assets/icons/nav_back.png';
  static const String hilal_icon_path = 'assets/icons/hilal_logo.png';
  static const String ahli_icon_path = 'assets/icons/ahli_logo.png';
  static const String nasser_icon_path = 'assets/icons/nasser_logo.png';
  static const String ettifaq_icon_path = 'assets/icons/ettifaq_logo.png';
  static const String shabab_icon_path = 'assets/icons/Shabab_logo.png';
  static const String ettihad_icon_path = 'assets/icons/etihad_logo.png';
  static const String twitter_pfp_path = 'assets/icons/twitter_icon.png';
  static const String home_icon_path = 'assets/icons/ic_home_24px.png';
  static const String schdeule_icon_path = 'assets/icons/ic_dns_24px.png';
  static const String news_icon_path = 'assets/icons/ic_fiber_new_24px.png';
  static const String stat_icon_path = 'assets/icons/Glyph.png';
  static const String more_icon_path =
      'assets/icons/icon-navigation-more_horiz_24px.png';
  static const String youtube_icon_path = "assets/icons/youtube.png";
  static const String linkedin_icon_path = "assets/icons/linkedin.png";
  static const String insta_icon_path = "assets/icons/insta.png";
  static const String twitter_icon_path = "assets/icons/youtube.png";
  static const String facebook_icon_path = "assets/icons/facebook.png";
  static const String translate_icon_path =
      "assets/icons/ic_g_translate_24px.png";
  static const String sp1 = "assets/icons/Component 2 – 1.png";
  static const String sp2 = "assets/icons/partner.png";
  static const String sp3 = "assets/icons/490276.png";
  static const String success_icon_path = 'assets/icons/Image 2.png';

  //Padding
  static const double MINI_PADDING = 6.0;
  static const double SMALL_PADDING = 12.0;
  static const double MEDIUM_PADDING = 18.0;
}

bool isEmail(String email) {
  String s =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(s);

  return regExp.hasMatch(email);
}

bool isNumeric(String? num) {
  if (num == null) {
    return false;
  }
  return double.tryParse(num) != null || int.tryParse(num) != null;
}

postData(ContactAPI data) async {
  var response = await http.post(
      Uri.parse('https://615d4dea12571a001720752d.mockapi.io/contactus'),
      body: {
        "firstName": data.firstName,
        "lastName": data.lastName,
        "email": data.email,
        "mobile": data.mobile,
        "messageTitle": data.messageTitle,
        "messageType": data.messageType,
        "messageDesc": data.messageDesc,
        "attachment": data.attachment,
      });

  print(response.body);
  String postResponse = jsonDecode(response.body);
  return postResponse;
}
