
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  Color _accentColor = Colors.blue[50];

  DateTime _selectedDateTime = DateTime.now();
  DateFormat _dateFormat = new DateFormat('EEE, MMM d');
  @override
  Widget build(BuildContext context) {
    print('Inside');
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task', style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
            child: RaisedButton(
              color: Colors.blue,
                child: Text('Done', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              onPressed: () {

              },
            ),
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
                fontSize: 23,
                fontWeight: FontWeight.w800
              ),
              decoration: InputDecoration(
                hintText: 'Task Title',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                disabledBorder: OutlineInputBorder(borderSide: BorderSide.none)
              ),
            )
          ),
          Divider(color: _accentColor, thickness: 3,),
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            margin: EdgeInsets.all(5),
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
                  _taskTimeData().then((dateValue) => {
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
              margin: EdgeInsets.all(5),
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: _accentColor, width: 3)
                  )
              ),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10),),
                  IconButton(icon: Icon(Icons.alarm_add), onPressed: () {
                    _taskTimeData().then((dateValue) => {
                      setState(() {
                        _selectedDateTime = dateValue;
                      })
                    }).catchError((error) {
                      // do nothing
                    });
                  }),
                  Text('Reminder', style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),)
                ],
              )
          ),
        ],
      ),
    );
  }

  Future<DateTime> _taskTimeData() {
    
    Future<DateTime> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
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
}
