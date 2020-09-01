import 'package:flutter/cupertino.dart';

class News {
  final String title;
  final String description;
  final String imageUrl;
  final String contentUrl;
  final String author;
  final String category;

  const News({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.contentUrl,
    @required this.author,
    @required this.category,
  });

  News.fromJson(Map jsonMap)
      : assert(jsonMap['title'] != null),
        assert(jsonMap['description'] != null),
        assert(jsonMap['author'] != null),
        assert(jsonMap['url'] != null),
        assert(jsonMap['category'] != null),
        assert(jsonMap['image'] != null),
        title = jsonMap['title'],
        description = jsonMap['description'],
        imageUrl = jsonMap['image'],
        contentUrl = jsonMap['url'],
        author = jsonMap['author'],
        category = (jsonMap['category'] as List).first;
}
