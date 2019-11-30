import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasksapp/AboutPage.dart';
import 'package:tasksapp/NotificationSetting.dart';
import 'package:tasksapp/ProfileSetting.dart';
import 'package:tasksapp/login_page.dart';
import 'signin.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/olivier-guillard-aSmxd4neejM-unsplash.jpg')
              )
            ),
            height: 250,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
//                      IconButton(icon: Icon(Icons.settings, color: Colors.white,))
//                    ],
//                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('images/user.jpg'),
                        radius: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Profile Settings'),
                  subtitle: Text('Change profile settings'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ProfileSetting()
                    ));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Notification Preferences'),
                  subtitle: Text('Change notifications settings'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => NotificationSetting()
                    ));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('About'),
                  subtitle: Text('Read about us'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AboutPage()));
                  },
                ),
                Divider(),
              ],
            ),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                      fontSize: 14
                      ),
                    ),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LoginPage()))
                    },
                  ),
                ]
            )
          )
        ]
      )
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  Widget _profileImageSection() {
    return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10)),
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 50,
            ),
            Padding(padding: EdgeInsets.all(10)),
          ],
    ));
  }

  Widget _profilePersonalInformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10)),
        Text('Personal Information',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Column(
          children: <Widget>[Text('Name')],
        )
      ],
    );
  }
}
