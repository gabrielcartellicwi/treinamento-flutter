import 'package:exercicio_10/models/brand.model.dart';
import 'package:exercicio_10/services/fipe.service.dart';
import 'package:exercicio_10/ui/components/loader.component.dart';
import 'package:exercicio_10/ui/components/search.component.dart';
import 'package:exercicio_10/ui/pages/vehicle.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandPageArguments {
  String title;

  BrandPageArguments(this.title);
}

class BrandPage extends StatefulWidget {
  static const routeName = '/brand';
  final BrandPageArguments args;

  BrandPage(this.args);

  @override
  _BrandPageState createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  List<Brand> mainDataList = <Brand>[];

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _loadData();
  }

  _loadData() async {
    mainDataList = await FipeService.getBrands(widget.args.title);
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
              nextPage: VehiclePage.routeName,
              vehicleKey: null,
              id: null,
            ),
    );
  }
}
