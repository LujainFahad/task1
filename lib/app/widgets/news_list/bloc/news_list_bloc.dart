import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:trainee_task/app/utility/shared_widgets/repository.dart';
import 'package:trainee_task/app/widgets/home/core/bloc/home_bloc.dart';

part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final NewsRepository newsRepo;
  NewsListBloc({required this.newsRepo}) : super(NewsListInitial()) {
    on<GetNews>((event, emit) async {
      emit(NewsListLoading());
      try {
        final news = await newsRepo.getContent(1);
        emit(NewsListLoaded(news.news));
      } catch (e) {
        emit(NewsListFailure(e.toString()));
      }
    });
  }
}
