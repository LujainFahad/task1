part of 'lang_bloc.dart';

abstract class LangState extends Equatable {
  const LangState();

  @override
  List<Object> get props => [];
}

class LangInitial extends LangState {}

class LangLoading extends LangState {}

class LangSuccess extends LangState {
  final App_Supported_Lang? languageCode;

  const LangSuccess({@required this.languageCode});
  @override
  List<Object> get props => [languageCode!];
}

class LangFailure extends LangState {
  final String? message;

  const LangFailure({@required this.message});
  @override
  List<Object> get props => [message!];
}
