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
                  title: 'TITLE',
                  author: 'AUTHOR',
                  contentUrl: 'URL',
                  imageUrl:
                      'https://i.insider.com/5f4c7c887ffa48002894d16b?width=1200&format=jpeg',
                  description: 'DESCRIPT',
                  category: 'CATEGORY',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
