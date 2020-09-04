import 'package:dio/dio.dart';
import 'package:exercicio_9/models/dog_image.model.dart';

class Api {
  String breed;

  static Future<DogImage> retrieveDogBreedImage(breed) async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://dog.ceo/api/';

    Response response = await dio.get('breed/$breed/images/random');

    final dynamic data = response.data;

    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    DogImage dogImage =  DogImage.fromJson(data);

    return dogImage;
  }

  static Future<DogImage> retrieveDogRandomImage() async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://dog.ceo/api/';

    Response response = await dio.get('breeds/image/random');

    final dynamic data = response.data;

    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    DogImage dogImage =  DogImage.fromJson(data);

    return dogImage;
  }
}
