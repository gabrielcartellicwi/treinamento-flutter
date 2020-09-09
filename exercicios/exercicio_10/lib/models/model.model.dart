import 'package:flutter/cupertino.dart';

class Model {
  final String key;
  final String name;
  final String fipeCodigo;

  Model({
    @required this.key,
    @required this.name,
    @required this.fipeCodigo,
  });

  Model.fromJson(Map jsonMap)
      : assert(jsonMap['key'] != null),
        assert(jsonMap['name'] != null),
        assert(jsonMap['fipe_codigo'] != null),
        key = jsonMap['key'],
        name = jsonMap['name'],
        fipeCodigo = jsonMap['fipe_codigo'];
}
