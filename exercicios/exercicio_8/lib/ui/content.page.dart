import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/news.model.dart';
import '../utils/color.utils.dart';

class ContentPageArguments {
  final News news;

  ContentPageArguments(this.news);
}

class ContentPage extends StatelessWidget {
  static const routeName = '/content';
  final ContentPageArguments args;

  ContentPage(this.args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorUtils.appBarBackground,
          title: Text(
            args.news.author,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: WebView(
            initialUrl: args.news.contentUrl,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
