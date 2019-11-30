
import 'package:flutter/material.dart';
import 'package:tasksapp/add_item.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.lightBlue,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItem()),
          );
        },
        hoverColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Text('Hello Page'),
    );
  }
}
