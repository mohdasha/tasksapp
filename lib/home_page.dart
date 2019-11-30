
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasksapp/account_page.dart';
import 'package:tasksapp/add_item.dart';
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
  int _currentSelectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgets = <Widget>[
    TaskPage(),
    ProfilePage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        bottomNavigationBar: _prepareBottomNavigationBar(),
        appBar: AppBar(
          title: Text(pageTitle, style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          actions: <Widget>[
            _appBarAction()
          ],
        ),
        body: _widgets[_currentSelectedIndex],
      ),
    );
  }

  Widget _prepareBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            title: Text('Items'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account')
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
  Widget _appBarAction() {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Icon(Icons.search, color: Colors.black),
    );
  }

  Widget _prepareBody() {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: _prepareTasks()
      )
    );
  }

  List<Widget> _prepareTasks() {
    List<Widget> tasks = new List();

    for(int i=0; i<50; i++) {
      tasks.add(
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const Text('I\'m dedicating every day to you', style: TextStyle(fontWeight: FontWeight.bold)),
                Divider()
              ],
            ),
          ),
        ),
      );
    }
    return tasks;
  }

  _handleAccountButton() {
    print('Inside Handle Account');
    Navigator.of(null).push(MaterialPageRoute(
        builder: (context) {
          return AccountPage();
        }
    ));
  }
}