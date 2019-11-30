
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasksapp/add_item.dart';
import 'package:tasksapp/pojo/Task.dart';


Map<String, Color> _taskStatusColor = {
  'active' : Color.fromRGBO(255,255,255,100),
  'paused' : Color.fromRGBO(249, 226, 218, 100),
  'pausedHighlight' : Color.fromRGBO(220, 129, 81, 100),
  'activeHighlight' : Color.fromRGBO(223 , 223, 223, 100)
};

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  DateFormat _dateFormat = DateFormat('EEE, MMM d');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tasks',
          style: TextStyle(
            fontSize: 16
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent[200],
        splashColor: Colors.lightBlue,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItem()),
          );
        },
        hoverColor: Colors.blueAccent[200],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: _prepareTaskView(),
    );
  }

  Widget _prepareTaskList() {

    List<Task> tasks = List();
    List<String> _tags = ['#Onboarding', '#Harman', '#FirstDay'];
    Task task1 = new Task('Fill Onboarding Forms', _tags, 'paused');
    Task task2 = new Task('Taking Initial KT from Pankaj', _tags, 'active');
    Task task3 = new Task('Collect laptop with configuration', _tags, 'active');

    tasks.add(task1);
    tasks.add(task2);
    tasks.add(task3);

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return _taskItem(tasks[index]);
      }
    );
  }

  Widget _prepareTaskView() {
    return Container(
      child: _prepareTaskList(),
//      child: ListView(
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.all(15),
//            child: Text(
//              'Today',
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                color: Colors.grey,
//                fontFamily: 'Roboto',
//                fontStyle: FontStyle.normal,
//                fontSize: 14,
//            ),),
//          ),
//          Card(
//            margin: EdgeInsets.all(0),
//            elevation: 10,
//            child: Container(
//              padding: EdgeInsets.all(10),
//              height: 80,
//              decoration: BoxDecoration(
//                color: Color.fromRGBO(249, 226, 218, 100),
//                border: Border(bottom: BorderSide(width: 3, color: Color.fromRGBO(220, 129, 81, 100),))
//              ),
//              child: Column(
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Fill Onboarding Forms', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//                        Padding(padding: EdgeInsets.only(top: 5)),
//                        Text('#Onboarding #Harman #FirstDay', style: TextStyle(fontSize: 12))
//                      ],
//                    )],
//                  ),
//                ],
//              ),
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(10),
//            height: 80,
//            decoration: BoxDecoration(
//                color: Color.fromRGBO(255,255,255,100),
//                border: Border(bottom: BorderSide(width: 3, color: Color.fromRGBO(223 , 223, 223, 100),))
//            ),
//            child: Column(
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Taking Initial KT from Pankaj', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//                        Padding(padding: EdgeInsets.only(top: 5)),
//                        Text('#Onboarding #Harman #FirstDay', style: TextStyle(fontSize: 12))
//                      ],
//                    )],
//                ),
//              ],
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(15),
//            child: Text(
//              _dateFormat.format(DateTime.now()).toString(),
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                  color: Colors.grey,
//                  fontFamily: 'Roboto',
//                  fontStyle: FontStyle.normal,
//                  fontSize: 14
//              ),),
//          ),
//          Container(
//            padding: EdgeInsets.all(10),
//            height: 80,
//            decoration: BoxDecoration(
//                color: Color.fromRGBO(255,255,255,100),
//                border: Border(bottom: BorderSide(width: 3, color: Color.fromRGBO(223 , 223, 223, 100),))
//            ),
//            child: Column(
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Collect laptop with configuration', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//                        Padding(padding: EdgeInsets.only(top: 5)),
//                        Text('#Onboarding #Harman #FirstDay', style: TextStyle(fontSize: 12))
//                      ],
//                    )],
//                ),
//              ],
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(10),
//            height: 80,
//            decoration: BoxDecoration(
//                color: Color.fromRGBO(255,255,255,100),
//                border: Border(bottom: BorderSide(width: 3, color: Color.fromRGBO(223 , 223, 223, 100),))
//            ),
//            child: Column(
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Go through the project Architecture', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//                        Padding(padding: EdgeInsets.only(top: 5)),
//                        Text('#Onboarding #Harman #FirstDay', style: TextStyle(fontSize: 12))
//                      ],
//                    )],
//                ),
//              ],
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(10),
//            height: 80,
//            decoration: BoxDecoration(
//                color: Color.fromRGBO(255,255,255,100),
//                border: Border(bottom: BorderSide(width: 3, color: Color.fromRGBO(223 , 223, 223, 100),))
//            ),
//            child: Column(
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('Make sure to collect Joining Bonus :D', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//                        Padding(padding: EdgeInsets.only(top: 5)),
//                        Text('#Onboarding #Harman #FirstDay', style: TextStyle(fontSize: 12))
//                      ],
//                    )],
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
    );
  }

  Widget _taskItem(Task task) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 80,
      decoration: BoxDecoration(
          color: _taskStatusColor[task.getStatus()],
          border: Border(bottom: BorderSide(width: 3, color: _taskStatusColor[task.getStatus()+'Highlight']))
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(task.getTitle(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text(task.getTags().toString(), style: TextStyle(fontSize: 12))
                ],
              )],
          ),
        ],
      ),
    );
  }
}
