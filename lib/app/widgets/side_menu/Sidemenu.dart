import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/widgets/contact_us/Contact_us.dart';
import 'package:url_launcher/url_launcher.dart';

class Sidemenu extends StatelessWidget {
  Sidemenu({
    Key? key,
  }) : super(key: key);
  static List<Color> color = [
    Colors.white,
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.white,
    Colors.red,
    Colors.green
  ];
  final List<String> itemsAr = [
    "دليل النوادي",
    "دليل الملاعب",
    "من نحن",
    "الأنظمة واللوائح",
    "اللجان",
    "تواصل معنا",
    "شارك التطبيق",
    "الاشتراك بالنشرة الاخبارية",
  ];
  final List<String> itemsEn = [
    "Clubs Guide",
    "Stadium Guide",
    "About Us",
    "Rules and Regulations",
    "Boards",
    "Contact Us",
    "Share the App",
    "Subscribe to Newsletter"
  ];

  static List<Widget> pages = [
    Contactusstep1(),
    Contactusstep1(),
    Contactusstep1(),
    Contactusstep1(),
    Contactusstep1(),
    Contactusstep1(),
    Contactusstep1(),
    Contactusstep1(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Image.asset(Constants.spl_icon_path),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 2,
                          height: 30,
                          color: color[index],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pages[index])),
                            },
                            child: Text(
                              Helpers.isAr ? itemsAr[index] : itemsEn[index],
                              style: const TextStyle(
                                fontFamily: 'bold',
                                fontSize: 20,
                                color: AppColors.textItem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12)
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => launchUrl(Uri.parse('')),
                child: Image.asset(
                  Constants.youtube_icon_path,
                ),
              ),
              InkWell(
                onTap: () => launchUrl(Uri.parse('')),
                child: Image.asset(
                  Constants.linkedin_icon_path,
                ),
              ),
              InkWell(
                onTap: () => launchUrl(Uri.parse('')),
                child: Image.asset(
                  Constants.insta_icon_path,
                ),
              ),
              InkWell(
                onTap: () => launchUrl(Uri.parse('')),
                child: Image.asset(
                  Constants.twitter_icon_path,
                ),
              ),
              InkWell(
                onTap: () => launchUrl(Uri.parse('')),
                child: Image.asset(
                  Constants.facebook_icon_path,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          TextButton(
            onPressed: () => translator.setNewLanguage(context,
                newLanguage: Helpers.isAr ? 'en' : 'ar'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 15),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Helpers.isAr ? 'English' : "عربي",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'regular',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(Constants.translate_icon_path)
                ],
              ),
            ),
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}
