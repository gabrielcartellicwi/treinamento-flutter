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
  })  : assert(title != null),
        assert(description != null),
        assert(imageUrl != null),
        assert(contentUrl != null),
        assert(author != null),
        assert(category != null);
}
