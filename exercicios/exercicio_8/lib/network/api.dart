import 'package:dio/dio.dart';
import '../models/news.model.dart';

class Api {
  static Future<List<News>> retrieveNewsList() async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://api.currentsapi.services/v1/';

    Response response = await dio.get(
        'latest-news?apiKey=kD2lFt4Y8nvLo0oWO_Oy1xH77zpdVoxOIghFO2KPgXJPxpZP');

    final dynamic data =  response.data;

    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    List<News> newsList = <News>[];
    data['news'].forEach((value) {
      if (value is Map) {
        News newsItem = News.fromJson(value);
        newsList.add(newsItem);
      }
    });

    return newsList;
  }
}
