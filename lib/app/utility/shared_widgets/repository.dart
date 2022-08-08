import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trainee_task/app/utility/shared_services/api_response.dart';
import 'package:trainee_task/app/utility/shared_services/api_urls.dart';

class NewsRepository {
  static String mainUrl = APIURLs.DOMAIN;
  final http.Client client;

  NewsRepository(this.client);

  Future<NewsResponse> getContent(int n) async {
    try {
      final headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
      };
      final url = mainUrl.replaceAll('{n}', n.toString());
      final response = await client.get(getUri(url), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        return NewsResponse.fromList(data);
      } else {
        throw Exception('Something Went Wrong');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Uri getUri(String url) {
    return Uri.parse(url);
  }
}
