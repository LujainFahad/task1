import 'dart:async';

import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/enum.dart';

class CustomizeLangStreamService {
  late StreamController<App_Supported_Lang> _customizeLangController;
  late App_Supported_Lang defaultState;

  CustomizeLangStreamService({
    this.defaultState = Constants.Default_App_Lang,
  }) {
    _customizeLangController = StreamController<App_Supported_Lang>();
  }
  Stream<App_Supported_Lang> get itemStream => _customizeLangController.stream;

  void pickItem(App_Supported_Lang state) {
    _customizeLangController.sink.add(state);
  }

  void close() {
    _customizeLangController.close();
  }
}
