import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor
      ),
            body: Column(
        children: [   

          // ConstrainedBox(
          //   constraints: BoxConstraints.expand(),
          //   child: FlatButton(onPressed: null,
          //   child: Image.asset('C:\Users\sahan\OneDrive\Documents\Visual Studio\HashPost\google_signin_buttons'))
          // ), 
          Text(
            "Create Account",
            style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 20
            )
          ),
        TextField(
          decoration: InputDecoration(
          labelText: 'Username'
          ),
        ),
        TextField(
          decoration: InputDecoration(

            labelText: 'Password'
          ),
        ),
        TextField(
          decoration: InputDecoration(

            labelText: 'Confirm Password'
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 7.0, bottom: 7.0)),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: FlatButton(
            color: Colors.grey,

            onPressed: () {
              //Add later, what to do when login button is pressed
            },
            child: Text("Create Account"),
          ),
          ),
        Text(
          "------------------- or -------------------",
          style: TextStyle(
          color: Colors.grey[600],
          //textAlign: TextAlign.center,
          fontSize: 12
          )
        ),
        Padding(padding: EdgeInsets.only(top: 7.0, bottom: 7.0)),
        RaisedButton(
          padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
          color: const Color(0xFF4285F4),
          onPressed: () {},
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Image.asset(
                'res/images/icons/google/btn_google_dark_normal_mdpi.9.png',
                height: 48.0,
              ),
              new Container(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: new Text("Sign in with Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              ),
            ],
          )
      ),
      ])
    );
  }
}


