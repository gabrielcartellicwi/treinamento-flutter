import 'package:exercicio_11/camera.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _onCameraBtnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CameraPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Antiguidades'),
          elevation: 0,
          bottom: TabBar(
            tabs: <Widget>[
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: _onCameraBtnPressed,
              ),
              Text('RECENTES'),
              Text('CONTATOS'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                'Clique no ícone para acessar a câmera.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                'Você ainda não encontrou nenhuma antiguidade.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                'Sua lista de contatos está vazia.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
