part of 'lang_bloc.dart';

abstract class LangEvent extends Equatable {
  const LangEvent();

  @override
  List<Object> get props => [];
}

class CurrentLanguageRequested extends LangEvent {}

class ArabicLanguageRequested extends LangEvent {}

class EnglishLanguageRequested extends LangEvent {}
