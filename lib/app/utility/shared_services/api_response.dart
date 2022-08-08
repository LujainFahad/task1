import 'package:trainee_task/app/utility/shared_services/api_services.dart';

class NewsResponse {
  final List<News> news;
  final String error;

  NewsResponse(this.news, this.error);

  NewsResponse.fromList(List<dynamic> json)
      : news = json.map((e) => News.fromJson(e)).toList(),
        error = '';

  NewsResponse.withError(String errorValue)
      : news = [],
        error = errorValue;
}
