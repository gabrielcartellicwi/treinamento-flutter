import 'package:exercicio_7/ui/content.page.dart';
import 'package:exercicio_7/utils/color.utils.dart';
import 'package:flutter/material.dart';

class NewsComponent extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String contentUrl;
  final String author;
  final String category;

  const NewsComponent({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.contentUrl,
    @required this.author,
    @required this.category,
  })  : assert(title != null),
        assert(description != null),
        assert(imageUrl != null),
        assert(contentUrl != null),
        assert(author != null),
        assert(category != null);

  _goToContentPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      ContentPage.routeName,
      arguments: ContentPageArguments(
        this.contentUrl,
        this.author,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 23,
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
                    child: Image.network(imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                      decoration: BoxDecoration(
                          color: ColorUtils.typeBackground,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        category,
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
                      title,
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
                      description,
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
