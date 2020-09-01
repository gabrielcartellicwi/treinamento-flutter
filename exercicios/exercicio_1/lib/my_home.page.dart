import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              children: [
                ColorBox(
                  color: Colors.purple[100],
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                ColorBox(
                  color: Colors.purple[200],
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                ColorBox(
                  color: Colors.purple[300],
                  width: MediaQuery.of(context).size.width * 0.34,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                ColorBox(
                  color: Colors.red[100],
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                ColorBox(
                  color: Colors.red[200],
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                ColorBox(
                  color: Colors.green[100],
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                ColorBox(
                  color: Colors.green[200],
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                ColorBox(
                  color: Colors.green[300],
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                ColorBox(
                  color: Colors.green[400],
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  double width;
  double height;
  Color color;

  ColorBox({
    @required this.width,
    @required this.height,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
