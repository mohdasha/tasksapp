import 'package:flutter/material.dart';
import 'package:tasksapp/signin.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        child: Image(image: AssetImage('images/appicon.png')),
                      ),
                      Padding(padding: EdgeInsets.all(5),),
                      SizedBox(
                        width: 210,
                        child: RaisedButton(
                          elevation: 10,
                          color: Colors.grey,
                          focusColor: Colors.red,
                          child: Row(
                            children: <Widget>[
                              Image(image: AssetImage('images/search.png'), width: 25, height: 25,),
                              Padding(padding: EdgeInsets.only(right: 10),),
                              Text(
                                'Login Using Google',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          onPressed: () => _handleSignIn(),
                        ),
                      ),
                      SizedBox(
                        width: 210,
                        child: RaisedButton(
                          elevation: 10,
                          color: Colors.grey,
                          focusColor: Colors.blueAccent,
                          child: Row(
                            children: <Widget>[
                              Image(image: AssetImage('images/facebook.png'), width: 25, height: 25,),
                              Padding(padding: EdgeInsets.only(right: 10),),
                              Text(
                                'Login Using facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ]
            )
        ),
      )
    );
  }

  _handleSignIn() {
    signInWithGoogle().whenComplete(() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return HomePage();
        }
      ));
    });
  }
}