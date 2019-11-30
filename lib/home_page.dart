
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasksapp/account_page.dart';
import 'package:tasksapp/profile_page.dart';
import 'package:tasksapp/tasks_page.dart';

String pageTitle = 'Home';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}
class HomePageState extends State<HomePage> {
  DateFormat _dateFormat = DateFormat('EEE, MMM d');
  int _currentSelectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgets = <Widget>[
    TaskPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home : Scaffold(
        bottomNavigationBar: _prepareBottomNavigationBar(),
        body: _widgets[_currentSelectedIndex],
      ),
    );
  }

  Widget _prepareBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            title: Text('Tasks'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings')
        )
      ],
      currentIndex: _currentSelectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentSelectedIndex = index;
    });
  }
}