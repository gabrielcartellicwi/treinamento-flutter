import 'package:exercicio_10/ui/pages/brand.page.dart';
import 'package:flutter/material.dart';

class VehicleTypeBtnComponent extends StatelessWidget {
  final String title;
  final IconData icon;

  const VehicleTypeBtnComponent({
    @required this.title,
    @required this.icon,
  });

  _goToBrandPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      BrandPage.routeName,
      arguments: BrandPageArguments(
        this.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        _goToBrandPage(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 7),
        child: Container(
          height: 80,
          width: 300,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
