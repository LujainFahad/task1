import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/navigation_service.dart';
import 'package:trainee_task/app/widgets/bottom_navigation/bottom_nav.dart';
import 'package:trainee_task/app/widgets/splash/ui/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: translator.delegates,
      locale: translator.activeLocale,
      supportedLocales: translator.locals(),
      home: const BottomNav(),
    );
  }
}
