import 'package:flutter/material.dart';
import 'package:trainee_task/app/utility/app_colors.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBack,
      appBar: AppBar(
        centerTitle: true,
        title: Text('error'),
      ),
    );
  }
}
