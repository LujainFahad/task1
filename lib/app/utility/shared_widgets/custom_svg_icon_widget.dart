import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class CustomSvgIconWidget extends StatelessWidget {
  final String? iconPath;
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;
  final Alignment? iconAlignment;
  final BoxFit? iconFit;
  const CustomSvgIconWidget(
    this.iconPath, {
    Key? key,
    this.iconWidth = 16,
    this.iconHeight = 16,
    this.iconColor,
    this.iconAlignment = Alignment.center,
    this.iconFit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath!,
      color: iconColor,
      width: iconWidth,
      height: iconHeight,
      alignment: iconAlignment!,
      fit: iconFit!,
    );
  }
}
