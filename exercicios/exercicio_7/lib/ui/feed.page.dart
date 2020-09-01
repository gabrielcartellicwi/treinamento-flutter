import 'package:exercicio_7/ui/new.component.dart';
import 'package:exercicio_7/utils/color.utils.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorUtils.appBarBackground,
        title: Text(
          'News',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorUtils.darkBackground,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                NewsComponent(
                  title:
                      "Here's what it looked like when a Ukrainian fighter jet smacked into a road sign while landing on a highway",
                  author: 'Tom Demerly',
                  contentUrl:
                      'https://www.businessinsider.com/ukrainian-fighter-jet-hits-road-sign-while-landing-on-highway-2020-8',
                  imageUrl:
                      'https://i.insider.com/5f4c7c887ffa48002894d16b?width=1200&format=jpeg',
                  description:
                      'Several Ukrainian combat jets and were practicing landings on a highway when one collided with a sign, narrowly avoiding a more serious accident....',
                  category: 'general',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
