import 'package:flutter/material.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/shared_widgets/custom_svg_icon_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
