import 'package:flutter/material.dart';

import 'ui/content.page.dart';
import 'ui/feed.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FeedPage(),
        ContentPage.routeName: (context) => ContentPage(
              ModalRoute.of((context)).settings.arguments,
            ),
      },
    );
  }
}
