import 'package:flutter/cupertino.dart';

class Brand {
  final String name;
  final String fipeName;
  final int id;

  Brand({
    @required this.name,
    @required this.fipeName,
    @required this.id,
  });

  Brand.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['fipe_name'] != null),
        assert(jsonMap['id'] != null),
        name = jsonMap['name'],
        fipeName = jsonMap['fipe_name'],
        id = jsonMap['id'];
}
