import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/helpers.dart';

class ContactUsSuccess extends StatelessWidget {
  const ContactUsSuccess({Key? key, required this.id}) : super(key: key);
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.spl_icon_path,
          height: 40,
          width: 61,
          // scale: .7,
        ),
        backgroundColor: AppColors.backgroundColor1,
        toolbarHeight: 100,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Constants.nav_icon_path),
                  fit: BoxFit.fill)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            "successWord".tr(),
            style: const TextStyle(
                color: AppColors.main, fontSize: 22, fontFamily: 'regular'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            Helpers.isAr ? 'رقم الطلب:' : 'Order number:',
            style: const TextStyle(
                fontSize: 17, color: Color(0xFF707070), fontFamily: 'regular'),
          ),
        ),
        Text(
          '$id',
          style: const TextStyle(
              fontSize: 17, color: Color(0xFF707070), fontFamily: 'regular'),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(child: Image.asset(Constants.success_icon_path)),
        const SizedBox(
          height: 145,
        ),
      ]),
    );
  }
}
