import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:trainee_task/app/utility/shared_widgets/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewsRepository newsRepository;

  HomeBloc({required this.newsRepository}) : super(HomeInitial()) {
    on<GetNews>((event, emit) async {
      try {
        final news = await newsRepository.getContent(1);
        emit(HomeLoaded(news.news));
      } catch (e) {
        HomeFailure(e.toString());
      }
    });
  }
}
