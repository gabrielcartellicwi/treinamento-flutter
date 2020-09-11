import 'package:camera/camera.dart';
import 'package:exercicio_11/picture.page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController cameraController;
  List<CameraDescription> cameras;

  void _startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _startCamera();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  _onTakePicturePressed(context) async {
    final tempPath = join(
      (await getTemporaryDirectory()).path, //Temporary path
      '${DateTime.now()}.png',
    );
    await cameraController.takePicture(tempPath);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PicturePage(
          picturePath: tempPath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CameraPreview(cameraController),
          SafeArea(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 32,
              onPressed: () => {
                Navigator.pop(context)
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  height: 64,
                  width: 64,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () => {_onTakePicturePressed(context)},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
