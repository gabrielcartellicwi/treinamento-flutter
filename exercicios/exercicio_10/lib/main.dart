import 'package:exercicio_10/ui/pages/detail.page.dart';
import 'package:exercicio_10/ui/pages/home.page.dart';
import 'package:exercicio_10/ui/pages/brand.page.dart';
import 'package:exercicio_10/ui/pages/model.page.dart';
import 'package:exercicio_10/ui/pages/vehicle.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        BrandPage.routeName: (context) => BrandPage(
              ModalRoute.of((context)).settings.arguments,
            ),
        VehiclePage.routeName: (context) => VehiclePage(
              ModalRoute.of((context)).settings.arguments,
            ),
        ModelPage.routeName: (context) => ModelPage(
              ModalRoute.of((context)).settings.arguments,
            ),
        DetailPage.routeName: (context) => DetailPage(
              ModalRoute.of((context)).settings.arguments,
            ),
      },
    );
  }
}
