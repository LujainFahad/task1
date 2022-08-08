import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:trainee_task/app/utility/enum.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/utility/shared_services/shared_prefs_services.dart';

part 'lang_state.dart';
part 'lang_event.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangInitial());

  @override
  Stream<LangState> mapEventToState(LangEvent event) async* {
    if (event is CurrentLanguageRequested) {
      yield* _mapCurrentLanguageRequestedToState(event);
    } else if (event is ArabicLanguageRequested) {
      yield* _mapArabicLanguageRequestedToState(event);
    } else if (event is EnglishLanguageRequested) {
      yield* _mapEnglishLanguageRequestedToState(event);
    }
  }

  Stream<LangState> _mapCurrentLanguageRequestedToState(
      CurrentLanguageRequested event) async* {
    try {
      final langCode = await SharedPrefsServices.getAppLanguageSettings();

      yield LangSuccess(languageCode: langCode);
    } catch (error) {
      yield LangFailure(
        message: Helpers.translatingWord('errorUnexpectedWord'),
      );
    }
  }

  Stream<LangState> _mapArabicLanguageRequestedToState(
      ArabicLanguageRequested event) async* {
    try {
      final langSetting = await SharedPrefsServices.updateAppLanguageSettings(
          App_Supported_Lang.AR);
      yield LangSuccess(languageCode: langSetting!.langCode);
    } catch (error) {
      yield LangFailure(
        message: Helpers.translatingWord('errorUnexpectedWord'),
      );
    }
  }

  Stream<LangState> _mapEnglishLanguageRequestedToState(
      EnglishLanguageRequested event) async* {
    try {
      final langSetting = await SharedPrefsServices.updateAppLanguageSettings(
          App_Supported_Lang.EN);
      yield LangSuccess(languageCode: langSetting!.langCode);
    } catch (error) {
      yield LangFailure(
        message: Helpers.translatingWord('errorUnexpectedWord'),
      );
    }
  }
}
