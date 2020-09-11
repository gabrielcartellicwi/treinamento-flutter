import 'dart:io';

import 'package:exercicio_11/resume.page.dart';
import 'package:flutter/material.dart';

class PicturePage extends StatefulWidget {
  final String picturePath;

  const PicturePage({@required this.picturePath});

  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  _onPressedBtnConfirmar() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ResumePage(
          picturePath: widget.picturePath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prévia',
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Image.file(
              File(widget.picturePath),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FlatButton(
                    child: Text(
                      'Descartar',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () => {Navigator.pop(context)},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FlatButton(
                    child: Text(
                      'Confirmar',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: _onPressedBtnConfirmar,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
