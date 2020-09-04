import 'dart:async';

import 'package:exercicio_9/models/dog_image.model.dart';
import 'package:exercicio_9/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _breedController = TextEditingController();
  String _breed;
  String _lastBreed;
  DogImage _dogBreedImage;
  bool _imageGot = false;
  bool _notFound = false;

  _getImageLogic() {
    if (_breedController.text.length > 2 && _breedController.text.isNotEmpty) {
      _breed = _breedController.text;
      _dogBreedImage = null;
      _imageGot = false;
      _startTimer(_breed);
    }
  }

  _startTimer(breed) {
    Timer(Duration(seconds: 1), _getImage(breed));
  }

  _getImage(breed) async {
    try {
      _dogBreedImage = await Api.retrieveDogBreedImage(breed);
      _imageGot = true;
    } catch (e) {
      _notFound = true;
    }
    _lastBreed = breed;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/paw.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.1),
            BlendMode.dstIn,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  Text(
                    'Type the breed you want to see:',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 18),
                    controller: _breedController,
                    onChanged: (context) {
                      _getImageLogic();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          if (_imageGot)
            Column(
              children: <Widget>[
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.network(_dogBreedImage.urlImage),
                ),
                FlatButton(
                  child: Text(
                    'Another one',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    _getImage(_lastBreed);
                  },
                ),
              ],
            )
          else if (_notFound)
            Container(child: Column(
              children: <Widget>[
                Text(
                  "The breed you typed was not found, so we will show 'Vira-lata Caramelo',"
                      " one of the most famous dog breed in Brazil.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/images/viralata.jpeg'),
                ),
              ],
            ),)
          else
            Container(),
        ],
      ),
    );
  }
}
