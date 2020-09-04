import 'dart:io';

import 'package:exercicio_9/models/dog_image.model.dart';
import 'package:exercicio_9/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PicDayPage extends StatefulWidget {
  @override
  _PicDayPageState createState() => _PicDayPageState();
}

class _PicDayPageState extends State<PicDayPage> {
  DogImage _dogBreedImage;
  bool _imageGot = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _loadRandomImage();
  }

  _loadRandomImage() async {
    _dogBreedImage = await Api.retrieveDogRandomImage();
    _imageGot = true;

    setState(() {});
  }

  Widget _loader() {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    );
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
      child: _imageGot
          ? Image.network(_dogBreedImage.urlImage)
          : _loader(),
    );
  }
}
