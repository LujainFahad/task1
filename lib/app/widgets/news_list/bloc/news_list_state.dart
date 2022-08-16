part of 'news_list_bloc.dart';

abstract class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListInitial extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListFailure extends NewsListState {
  final String msg;

  const NewsListFailure(this.msg);
  @override
  List<Object> get props => [msg];
}

class NewsListLoaded extends NewsListState {
  final List<News> news;

  const NewsListLoaded(this.news);
  @override
  List<Object> get props => [news];
}
