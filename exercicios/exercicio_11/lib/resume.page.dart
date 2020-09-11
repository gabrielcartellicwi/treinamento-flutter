import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumePage extends StatefulWidget {
  final String picturePath;

  const ResumePage({@required this.picturePath});

  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  String _currentPosition;

  String get _currentLocationLink =>
      'https://www.google.com/maps/search/?api=1&query=$_currentPosition';

  @override
  initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    Position position = await getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(position.latitude);
    setState(() {
      _currentPosition = '${position.latitude},${position.longitude}';
    });
  }

  _onLocationLinkPressed() async {
    await launch(_currentLocationLink);
  }

  _onSharePressed() {
    Share.shareFiles(
      [widget.picturePath],
      text: 'Antiguidade encontrada! Local: $_currentLocationLink',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(widget.picturePath)),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200,
                width: double.infinity,
                child: SizedBox(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ver no mapa',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      child: Text(
                        _currentLocationLink,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blueAccent,
                        ),
                      ),
                      onTap: _onLocationLinkPressed,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: FlatButton(
                    color: Colors.blueAccent,
                    child: Text('Compartilhar'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: _onSharePressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
