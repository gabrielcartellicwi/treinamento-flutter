import 'package:exercicio_10/models/model.model.dart';
import 'package:exercicio_10/services/fipe.service.dart';
import 'package:exercicio_10/ui/components/loader.component.dart';
import 'package:exercicio_10/ui/components/search.component.dart';
import 'package:exercicio_10/ui/pages/detail.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelPageArguments {
  String title;
  dynamic key;
  String id;

  ModelPageArguments(this.title, this.key, this.id);
}

class ModelPage extends StatefulWidget {
  static const routeName = '/model';
  final ModelPageArguments args;

  ModelPage(this.args);

  @override
  _ModelPageState createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  List<Model> mainDataList = <Model>[];

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _loadData();
  }

  _loadData() async {
    mainDataList = await FipeService.getModels(
      widget.args.title,
      widget.args.key,
      widget.args.id,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: mainDataList.isEmpty
          ? Loader(
              context: context,
            )
          : SearchComponent(
              dataList: mainDataList,
              title: widget.args.title,
              nextPage: DetailPage.routeName,
              vehicleKey: widget.args.key,
              id: widget.args.id,
            ),
    );
  }
}
