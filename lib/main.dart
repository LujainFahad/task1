import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'package:trainee_task/app/app.dart';
import 'package:trainee_task/app/utility/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeType: LocalizationDefaultType.asDefined,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: Constants.App_Lang_Path,
  );
  BlocOverrides.runZoned(
    () => runApp(
      LocalizedApp(
        child: const App(),
      ),
    ),
  );
}
