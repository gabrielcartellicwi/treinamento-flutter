
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final BuildContext context;

  const Loader({@required this.context});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    );
  }
}
