import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/utility/shared_widgets/post_button.dart';

class Contactusstep1 extends StatelessWidget {
  Contactusstep1({
    Key? key,
  }) : super(key: key);
  final List<String> fields = [
    "enterFirstNameWord".tr(),
    "enterLastNameWord".tr(),
    'example@example.com',
    '05XXXXXXXXX'
  ];
  final List<String> fieldNames = [
    "firstNWord".tr(),
    "lastNWord".tr(),
    "emailWord".tr(),
    "mobileWord".tr(),
  ];
  static List<TextEditingController> textFields = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  static List<String> errors = ['', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.appBack,
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(Constants.spl_icon_path),
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          bottom: TabBar(
            indicatorWeight: 4,
            labelColor: AppColors.main,
            indicatorColor: AppColors.main,
            tabs: [
              ListTile(
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                title: Center(
                    child: Text(
                  "dataWord".tr(),
                  style: TextStyle(fontFamily: 'bold', fontSize: 20),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      "nextWord".tr(),
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      ": ",
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: Text(
                      "infoWord".tr(),
                      style: TextStyle(
                          fontFamily: 'bold',
                          fontSize: 15,
                          color: AppColors.textGrey),
                    ),
                  ),
                ],
              ),
            ],
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "1/2",
                    style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: 13,
                        color: AppColors.textGrey),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              )
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text("contactusWord".tr(),
                  style: TextStyle(
                      fontFamily: 'bold', fontSize: 22, color: AppColors.main)),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Form(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              fieldNames[index],
                              style: TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: 15,
                                  color: AppColors.main),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Helpers.contactField(
                                  context, fields[index], textFields[index]),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              height: 40,
                              child: Text(
                                errors[index],
                                style: TextStyle(
                                    fontFamily: 'regular',
                                    fontSize: 13,
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PostButton(
              buttonT: "nextWord".tr(),
              page: 1,
            ),
            SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    );
  }
}
