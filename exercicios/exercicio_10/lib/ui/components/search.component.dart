import 'package:exercicio_10/ui/pages/detail.page.dart';
import 'package:exercicio_10/ui/pages/model.page.dart';
import 'package:exercicio_10/ui/pages/vehicle.page.dart';
import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  final dynamic dataList;
  final String title;
  final String nextPage;
  final dynamic vehicleKey;
  final dynamic id;

  const SearchComponent({
    @required this.dataList,
    @required this.title,
    @required this.nextPage,
    @required this.vehicleKey,
    @required this.id,
  })
      : assert(dataList != null),
        assert(title != null),
        assert(nextPage != null);

  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  TextEditingController _searchInputController = TextEditingController();
  dynamic key;
  dynamic mainDataList;
  dynamic newDataList;
  String newTitle;
  String vehicleId;
  String info;

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    mainDataList = widget.dataList;
    newDataList = mainDataList;
  }

  onItemChanged(String text) {
    setState(() {
      newDataList = mainDataList
          .where(
            (element) =>
        (element.name.toLowerCase().contains(
          text.toLowerCase(),
        )),
      )
          .toList();
    });
  }

  _goToPage(BuildContext context, index) {
    if (widget.nextPage == DetailPage.routeName) {
      newTitle = newDataList[index].fipeCodigo;
      key = widget.vehicleKey;
      info = newDataList[index].fipeCodigo;

      Navigator.pushNamed(
        context,
        widget.nextPage,
        arguments: DetailPageArguments(
          this.newTitle,
          this.key,
          this.widget.id,
          this.info,
        ),
      );
    } else {
      key = newDataList[index].id;
      newTitle = newDataList[index].fipeName;

      Navigator.pushNamed(
        context,
        widget.nextPage,
        arguments: VehiclePageArguments(
          this.newTitle,
          this.key,
        ),
      );
    }
  }

  _goToModelPage(BuildContext context, index) {
    key = widget.vehicleKey;
    newTitle = newDataList[index].fipeName;
    vehicleId = newDataList[index].id;

    Navigator.pushNamed(
      context,
      ModelPage.routeName,
      arguments: ModelPageArguments(
        this.newTitle,
        this.key,
        this.vehicleId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
              onChanged: onItemChanged,
              controller: _searchInputController,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: newDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: FlatButton(
                      onPressed: () {
                        widget.nextPage == ModelPage.routeName
                            ? _goToModelPage(context, index)
                            : _goToPage(context, index);
                      },
                      child: Row(
                        children: <Widget>[
                          Text(newDataList[index].name),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
