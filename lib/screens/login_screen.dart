import 'package:flutter/services.dart';
import 'package:flutter_tags/tag.dart' as fluttertags;
import 'package:flutter/material.dart';
import 'package:hashpost/functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hashpost/models/models.dart';
import 'package:fluttertoast/fluttertoast.dart';



class LoginScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [      
          Text(
            "Login",
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
        Text(
          'Don\'t have an account? Let\'s make one',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[700], fontSize: 15.0),
          
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: FlatButton(
            color: Colors.grey,
            //icon: Icon(Icons.add_a_photo), //`Icon` to display
            //label: Text('Login'), //`Text` to display
            onPressed: () {
              //Add later, what to do when login button is pressed
            },
            child: Text("Login"),
          ),
          ),
      ])
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }


   //State createState() => new _LoginScreenState();
}