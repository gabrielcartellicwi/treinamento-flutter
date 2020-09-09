import 'package:exercicio_10/ui/components/vehicle_type_btn.component.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIPE Table'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('Favorite Button');
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            VehicleTypeBtnComponent(
              title: 'Cars',
              icon: Icons.directions_car,
            ),
            VehicleTypeBtnComponent(
              title: 'Motorcycles',
              icon: Icons.motorcycle,
            ),
            VehicleTypeBtnComponent(
              title: 'Trucks',
              icon: Icons.local_shipping,
            )
          ],
        ),
      ),
    );
  }
}
