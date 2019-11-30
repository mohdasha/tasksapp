
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';


class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String taskHours;
  String taskMinutes;
  Color _accentColor = Colors.blue[50];
  String taskTitle;
  DateTime _selectedDateTime = DateTime.now();
  DateFormat _dateFormat = new DateFormat('EEE, MMM d');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Task', style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Roboto')),
        leading: FlatButton(
          padding: EdgeInsets.all(0),
          child: Text('Back',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
            ),
          ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text('Create', style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
      body: _prepareAddTaskBody(),
    );
  }

  Widget _prepareAddTaskBody() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 120,
            child: TextField(
              expands: false,
              minLines: 2,
              maxLines: 3,
              maxLength: 60,
              showCursor: true,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'
              ),
              decoration: InputDecoration(
                hintText: 'Task Title',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                disabledBorder: OutlineInputBorder(borderSide: BorderSide.none)
              ),
              onChanged: (context) {
                setState(() {
                  taskTitle = context.toString();
                });
              },
            )
          ),
          Divider(color: Colors.blueAccent, thickness: 3,),
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
//            margin: EdgeInsets.all(5),
            decoration: ShapeDecoration(
              color: _accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10),),
                IconButton(icon: Icon(Icons.calendar_today), onPressed: () {
                  _taskDateData().then((dateValue) => {
                    setState(() {
                      _selectedDateTime = dateValue;
                    })
                  }).catchError((error) {
                    // do nothing
                  });
                }),
                Text(_dateFormat.format(_selectedDateTime), style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)
              ],
            )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: _accentColor, width: 3,style: BorderStyle.none)
                  )
              ),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10),),
                  IconButton(icon: Icon(Icons.alarm_add), onPressed: () {

                  }),
                  Text('Reminder', style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),)
                ],
              )
          ),
          Container(
            height: 75,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: _accentColor, width: 2)
                  )
              ),
            child:  Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 25, right: 10),
                  child: IconButton(
                      icon: Icon(Icons.schedule),
                    onPressed: () {
                    },
                  ),
                ),
                Text('Duration', style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                DropdownButton<String>(
                  value: taskHours,
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      taskHours =  newValue.toString();
                    });
                  },
                  items: <String>['0','1', '2', '3', '4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                      .toList(),
                ),
                DropdownButton<String>(
                  value: taskMinutes,
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                      color: Colors.grey
                  ),
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      taskMinutes =  newValue.toString();
                    });
                  },
                  items: List<int>.generate(60, (i) => i+1)
                      .map<String>((int v) {
                        return v.toString();
                  })
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                      .toList(),
                ),
              ],
            )
          ),
        ]
      ),
    );
  }

  Future<DateTime> _taskDateData() {
    Future<DateTime> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );

    return selectedDate;
  }

  void _saveTask() {

  }

}
