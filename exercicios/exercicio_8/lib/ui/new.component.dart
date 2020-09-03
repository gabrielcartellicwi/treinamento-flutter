import '../models/news.model.dart';
import '../utils/color.utils.dart';
import 'package:flutter/material.dart';

import 'content.page.dart';


class NewsComponent extends StatelessWidget {
  final News news;

  const NewsComponent({
    @required this.news,
  })  : assert(news != null);

  _goToContentPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      ContentPage.routeName,
      arguments: ContentPageArguments(
        this.news,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 12,
          left: 24,
          right: 24,
          bottom: 12
      ),
      child: Container(
        width: 335,
        height: 340,
        color: ColorUtils.newsBackground,
        child: GestureDetector(
          onTap: () {
            _goToContentPage(context);
          },
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  SizedBox(
                    child: Image.network(news.imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                      decoration: BoxDecoration(
                          color: ColorUtils.typeBackground,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        news.category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      news.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      news.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
