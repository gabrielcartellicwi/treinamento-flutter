import 'package:exercicio_9/ui/pic_day.page.dart';
import 'package:exercicio_9/ui/search.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return SearchPage();
        break;
      case 1:
        return PicDayPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Paw City'),
        centerTitle: true,
      ),
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search for breed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Pic of the day'),
          ),
        ],
      ),
    );
  }
}
