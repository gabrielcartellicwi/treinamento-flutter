import 'package:flutter/cupertino.dart';

class Detail {
  final String name;
  final String yearModel;
  final String fuel;
  final String brand;
  final String value;

  Detail({
    @required this.name,
    @required this.yearModel,
    @required this.fuel,
    @required this.brand,
    @required this.value,
  });

  Detail.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['ano_modelo'] != null),
        assert(jsonMap['combustivel'] != null),
        assert(jsonMap['marca'] != null),
        assert(jsonMap['preco'] != null),
        name = jsonMap['name'],
        yearModel = jsonMap['ano_modelo'],
        fuel = jsonMap['combustivel'],
        brand = jsonMap['marca'],
        value = jsonMap['preco'];
}
