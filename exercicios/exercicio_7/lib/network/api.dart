import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/new.model.dart';

class Api {
  static Future<List<News>> retrieveLocalNews(BuildContext context) async {
    final String json = await DefaultAssetBundle.of(context)
        .loadString('assets/data/feed_data.json');

    final dynamic data = JsonDecoder().convert(json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    List<News> newsList = [];

    data.keys.forEach((key) {
      var news = News(
        title: key['title'],
        description: key['description'],
        imageUrl: key['image'],
        contentUrl: key['url'],
        author: key['author'],
        category: key['category'],
      );

      newsList.add(news);
    });

    return newsList;
  }
}