import 'package:exercicio_10/models/vehicle.model.dart';
import 'package:exercicio_10/services/fipe.service.dart';
import 'package:exercicio_10/ui/components/loader.component.dart';
import 'package:exercicio_10/ui/components/search.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model.page.dart';

class VehiclePageArguments {
  String title;
  dynamic key;

  VehiclePageArguments(this.title, this.key);
}

class VehiclePage extends StatefulWidget {
  static const routeName = '/vehicle';
  final VehiclePageArguments args;

  VehiclePage(this.args);

  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  List<Vehicle> mainDataList = <Vehicle>[];

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _loadData();
  }

  _loadData() async {
    mainDataList = await FipeService.getVehicles(
      widget.args.title,
      widget.args.key,
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
              nextPage: ModelPage.routeName,
              vehicleKey: widget.args.key,
              id: null,
            ),
    );
  }
}
