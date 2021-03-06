import 'dart:io';

import 'package:exercicio_7/models/news.model.dart';
import 'package:exercicio_7/network/api.dart';
import 'package:exercicio_7/ui/new.component.dart';
import 'package:exercicio_7/utils/color.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<News> _news = <News>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _loadData();
  }

  _loadData() async {
    _news = await Api.retrieveLocalNews(context);
    setState(() {});
  }

  Widget _loader() {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    );
  }

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
        child: _news.isEmpty ? _loader() : ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return NewsComponent(
              news: _news[index],
            );
          },
          itemCount: _news.length,
        ),
      ),
    );
  }
}
