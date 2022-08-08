import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'package:trainee_task/app/app.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/widgets/home/ui/home_screen.dart';
import 'package:trainee_task/simple_observer.dart';
import 'package:trainee_task/app/utility/helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeType: LocalizationDefaultType.asDefined,
    languagesList: Helpers.getListOfAppLanguages(),
    assetsDirectory: Constants.App_Lang_Path,
  );
  // runApp(
  //   LocalizedApp(
  //     child: BlocProvider<SplashScreenBloc>(
  //       create: (context) => SplashScreenBloc()..add(AppLoadedRequested()),
  //       child: const App(),
  //     ),
  //   ),
  // );
  BlocOverrides.runZoned(
    () => runApp(
      LocalizedApp(
        child: const App(),
      ),
    ),
  );
}
