import 'package:flutter/material.dart';

class DogImage {
  final String urlImage;

  const DogImage({
    @required this.urlImage,
  });

  DogImage.fromJson(Map jsonMap)
      : assert(jsonMap['message'] != null),
        urlImage = jsonMap['message'];
}
