import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Postcard',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            BoxContainer(
              label: 'Recipient',
              content: 'Amelie N Mason',
              iconData: Icons.person,
              color: Color(0xFFFC3875),
            ),
            BoxContainer(
              label: 'Address',
              content:
                  '47 Greyfriars Road, CAPHEATON\nUnited Kingdom\nNE19 5PJ',
              iconData: Icons.business,
              color: Color(0xFFFCAB55),
            ),
            BoxContainer(
              label: 'Message',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget nunc condimentum, volutpat diam in, molestie nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris aliquet eros nec diam sodales mollis,  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget nunc condimentum, volutpat diam in, molestie nisl. Pellentesque habitant morbi tristique senectus et netu.',
              iconData: Icons.edit,
              color: Color(0xFF22C0FC),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 190,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ButtonContainer(
                    label: 'SAVE DRAFT',
                    color: Color(0xFF767676),
                  ),
                  ButtonContainer(
                    label: 'REVIEW DESIGN',
                    color: Color(0xFFFC3875),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  String label;
  Color color;

  ButtonContainer({
    @required this.label,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        height: 40,
        width: 150,
        child: FlatButton(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            print(label);
          },
        ),
      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  String label;
  String content;
  IconData iconData;
  Color color;

  BoxContainer({
    @required this.label,
    @required this.content,
    @required this.iconData,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 30,
      ),
      child: Row(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 40,
                  width: 40,
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      width: 270,
                      child: Text(
                        content,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(122, 122, 122, 100),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
