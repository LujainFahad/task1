part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<News> news;

  HomeLoaded(this.news);

  @override
  // TODO: implement props
  List<Object?> get props => [news];
}

class HomeFailure extends HomeState {
  final String msg;

  HomeFailure(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
