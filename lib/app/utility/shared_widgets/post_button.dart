import 'package:flutter/material.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:trainee_task/app/widgets/contact_us/Contact_us.dart';
import 'package:trainee_task/app/widgets/contact_us/conatct_us2.dart';
import 'package:trainee_task/app/widgets/contact_us/contact_us_success.dart';

class PostButton extends StatelessWidget {
  PostButton({Key? key, required this.buttonT, required this.page})
      : super(key: key);
  int page;
  String buttonT;
  bool _isValid = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 319,
      child: ElevatedButton(
        onPressed: () {
          switch (page) {
            case 1:
              _isValid = true;
              if (Contactusstep1.textFields[0].text.isEmpty) {
                _isValid = false;
                Contactusstep1.errors[0] = "nameCheck".tr();
              } else if (Contactusstep1.textFields[1].text.isEmpty) {
                _isValid = false;
                Contactusstep1.errors[1] = "nameCheck".tr();
                Contactusstep1.errors[0] = '';
              } else if (!isEmail(Contactusstep1.textFields[2].text)) {
                _isValid = false;
                Contactusstep1.errors[2] = "emailCheck".tr();
                Contactusstep1.errors[0] = Contactusstep1.errors[1] = '';
              } else if (((!(Contactusstep1.textFields[3].text
                      .startsWith('05'))) ||
                  Contactusstep1.textFields[3].text.length != 10 ||
                  !(isNumeric(Contactusstep1.textFields[3].text)))) {
                _isValid = false;
                Contactusstep1.errors[3] = "phoneCheck".tr();
                Contactusstep1.errors[0] =
                    Contactusstep1.errors[1] = Contactusstep1.errors[2] = '';
              }

              if (_isValid) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Contactusstep2()));
              } else {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Contactusstep1()));
              }
              break;
            case 2:
              _isValid = true;
              if (Contactusstep2.textFields[0].text.isEmpty) {
                _isValid = false;
                Contactusstep2.errors[0] = "titleCheck".tr();
              } else if (Contactusstep2.textFields[1].text.isEmpty) {
                _isValid = false;
                Contactusstep2.errors[1] = "typeCheck".tr();
                Contactusstep2.errors[0] = '';
              } else if (Contactusstep2.textFields[2].text.isEmpty) {
                _isValid = false;
                Contactusstep2.errors[2] = "messageCheck".tr();
                Contactusstep2.errors[0] = Contactusstep1.errors[1] = '';
              }
              if (_isValid) {
                int count = 0;
                var post = ContactAPI(
                  firstName: Contactusstep1.textFields[0].text,
                  lastName: Contactusstep1.textFields[1].text,
                  email: Contactusstep1.textFields[2].text,
                  mobile: Contactusstep1.textFields[3].text,
                  messageTitle: Contactusstep2.textFields[0].text,
                  messageType: Contactusstep2.textFields[1].text,
                  messageDesc: Contactusstep2.textFields[2].text,
                  attachment: 'null',
                );
                postData(post).then((value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactUsSuccess(
                                id: value,
                              )),
                      (route) => count++ >= 2,
                    ));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Contactusstep2()));
              }
              break;
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.main),
        ),
        child: Text(
          buttonT,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'regular',
          ),
        ),
      ),
    );
  }
}
