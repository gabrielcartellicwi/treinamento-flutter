import 'package:exercicio_10/models/detail.model.dart';
import 'package:exercicio_10/models/vehicle.model.dart';
import 'package:exercicio_10/services/fipe.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPageArguments {
  String title;
  dynamic key;
  dynamic id;
  dynamic info;

  DetailPageArguments(this.title, this.key, this.id, this.info);
}

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';
  final DetailPageArguments args;

  DetailPage(this.args);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Detail detail;

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _loadData();
  }

  _loadData() async {
    detail = await FipeService.getDetail(
      widget.args.title,
      widget.args.key,
      widget.args.id,
      widget.args.info,
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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 300, left: 10, right: 10),
        child: Card(
          color: Colors.white,
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    detail.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Year model: ',
                          style: TextStyle(color: Colors.grey[700])),
                      Text(detail.yearModel,
                          style: TextStyle(color: Colors.grey[700])),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Fuel: ', style: TextStyle(color: Colors.grey[700])),
                      Text(detail.fuel,
                          style: TextStyle(color: Colors.grey[700])),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Brand: ', style: TextStyle(color: Colors.grey[700])),
                      Text(detail.brand,
                          style: TextStyle(color: Colors.grey[700])),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Value: ', style: TextStyle(color: Colors.grey[700])),
                      Text(detail.value,
                          style: TextStyle(color: Colors.green, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
