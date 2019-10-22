
import 'package:flutter/material.dart';

import 'createaccount_screen.dart';


// class LoginScreen extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [   
//           Text(
//             "Welcome to",
//             style: TextStyle(
//             color: Colors.black,
//             //fontWeight: FontWeight.bold,
//             fontSize: 45
//             )
//           ),
//           Text(
//             "HashPost",
//             style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 45
//             )
//           ),
//         Padding(padding: EdgeInsets.only(top: 10.0, bottom: 7.0)),
//         new Container(             
//           width: MediaQuery.of(context).size.width * 0.85,
//           child: TextField(
//               decoration: InputDecoration(
//               labelText: 'Username'
//             ),
//           ),
//         ),
//         new Container(              
//           width: MediaQuery.of(context).size.width * 0.85,
//           child: TextField(
//               decoration: InputDecoration(
//               labelText: 'Password'
//             ),
//           ),
//         ),

//         // TextField(//idk why I need this, but it centers the all components
//         //   decoration: InputDecoration(
//         //     labelText: ''
            
//         //   ),
//         // ),

//         Padding(padding: EdgeInsets.symmetric(vertical: 7.0)),
//         GestureDetector(
//           onTap: () {
//             print("onTap called.");
//             Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (BuildContext context) => CreateAccountScreen()),
//             );
//           },
//           child: Text(
//             "Don't have an account? Let's make one",
//             textScaleFactor: 0.8,
//             textAlign: TextAlign.center,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(color: Colors.black),
//             ),
//           ),
//         Padding(padding: EdgeInsets.only(top: 7.0, bottom: 7.0)),
//         Padding(
//           padding: const EdgeInsets.all(6.0),
//           child: FlatButton(
//             color: Colors.black,

//             onPressed: () {
//               //Add later, what to do when login button is pressed
//             },
//             child: Text("Login", style: TextStyle(color: Colors.white) ),
//           ),
//           ),
//         Text(
//           " OR ",
//           style: TextStyle(
//           color: Colors.black,
//           //textAlign: TextAlign.center,
//           fontSize: 12
//           )
//         ),
//         Padding(padding: EdgeInsets.only(top: 2.0, bottom: 7.0)),
//         RaisedButton(
//           padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
//           color: const Color(0xFF4285F4),
//           onPressed: () {
//             print("sign in with google");
//           },
//           child: new Row(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               new Image.asset(
//                 'res/images/icons/google/btn_google_dark_normal_mdpi.9.png',
//                 height: 35.0,
//               ),
//               new Container(
//                 padding: EdgeInsets.only(left: 10.0,right: 10.0),
//                   child: new Text("Sign in with Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
//               ),
//             ],
//           )
//       ),
//       ])
//     );
//   }

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return null;
//   }


//    //State createState() => new _LoginScreenState();
// }

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome to"),
              Text("HashPost"),
              LoginWidget(),
              Row(
                children: [
                  Text("Don't have an account?"),
                  GestureDetector(
                    child: Text("Create one here!"),
                    onTap: () {
                      MaterialPageRoute(builder: (context) => CreateAccountScreen());
                    }
                  )
                ]
              )
            ]
          )
        ),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: "Email",
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              obscureText: true
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text("Login"),
              onPressed: () {
                print(_email.text);
                print(_password.text);
              },
            ),
          )
        ]
      )
    );
  }
}