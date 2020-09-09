import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Vehicle {
  final String name;
  final String fipeName;
  final String id;

  Vehicle({
    @required this.name,
    @required this.fipeName,
    @required this.id,
  });

  Vehicle.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['fipe_name'] != null),
        assert(jsonMap['id'] != null),
        name = jsonMap['name'],
        fipeName = jsonMap['fipe_name'],
        id = jsonMap['id'];
}
