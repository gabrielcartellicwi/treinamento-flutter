import 'package:exercicio_7/utils/color.utils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPageArguments {
  final String contentUrl;
  final String author;

  ContentPageArguments(this.contentUrl, this.author);
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
          args.author,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Text(args.contentUrl, style: TextStyle(fontSize: 10),),
//        child: WebView(
//          initialUrl: args.contentUrl,
//          javascriptMode: JavascriptMode.unrestricted,
//        ),
      )
    );
  }
}
