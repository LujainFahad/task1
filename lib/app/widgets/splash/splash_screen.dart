import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/shared_widgets/custom_svg_icon_widget.dart';
import 'package:trainee_task/app/widgets/bottom_navigation/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initScreen(BuildContext context) {
    const double width = 314;
    const double height = 204;
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      body: Align(
        alignment: Alignment.center,
        child: CustomSvgIconWidget(
          Constants.splash_icon_path,
          iconWidth: width,
          iconHeight: height,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BottomNav()));
  }
}
