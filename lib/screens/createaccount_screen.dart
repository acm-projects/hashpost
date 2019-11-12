import 'package:flutter/material.dart';

// class CreateAccountScreen extends StatelessWidget{
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Theme.of(context).primaryColor
//       ),
//       body: Column(
//         children: [   

//           // ConstrainedBox(
//           //   constraints: BoxConstraints.expand(),
//           //   child: FlatButton(onPressed: null,
//           //   child: Image.asset('C:\Users\sahan\OneDrive\Documents\Visual Studio\HashPost\google_signin_buttons'))
//           // ), 
//           Text(
//             "Create Account",
//             style: TextStyle(
//             color: Colors.grey[800],
//             fontWeight: FontWeight.bold,
//             fontSize: 20
//             )
//           ),
//         TextField(
//           decoration: InputDecoration(
//           labelText: 'Username'
//           ),
//         ),
//         TextField(
//           decoration: InputDecoration(

//             labelText: 'Password'
//           ),
//         ),
//         TextField(
//           decoration: InputDecoration(

//             labelText: 'Confirm Password'
//           ),
//         ),
//         Padding(padding: EdgeInsets.only(top: 7.0, bottom: 7.0)),
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: FlatButton(
//             color: Colors.grey,

//             onPressed: () {
//               //Add later, what to do when login button is pressed
//             },
//             child: Text("Create Account"),
//           ),
//           ),
//         Text(
//           "------------------- or -------------------",
//           style: TextStyle(
//           color: Colors.grey[600],
//           //textAlign: TextAlign.center,
//           fontSize: 12
//           )
//         ),
//         Padding(padding: EdgeInsets.only(top: 7.0, bottom: 7.0)),
//         RaisedButton(
//           padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
//           color: const Color(0xFF4285F4),
//           onPressed: () {},
//           child: new Row(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               new Image.asset(
//                 'res/images/icons/google/btn_google_dark_normal_mdpi.9.png',
//                 height: 48.0,
//               ),
//               new Container(
//                 padding: EdgeInsets.only(left: 10.0,right: 10.0),
//                   child: new Text("Sign in with Google", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
//               ),
//             ],
//           )
//       ),
//       ])
//     );
//   }
// }

class CreateAccountScreen extends StatelessWidget{
  const CreateAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo 2.png"),
              Text("hashpost.", style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.w500)),
              Text("socials made easier.", style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w500)),
              Padding(padding: EdgeInsets.all(10.0),),
              Text("Automatically sync up your old posts and make hashtagging easier by selecting from a range of relevent hashtags.", style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),

              CreateAccountWidget(),
            ]
          )
        ),
      ),
    );
  }
}

class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({Key key}) : super(key: key);

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(15.0),),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: FlatButton(
              child: Text("Continue with Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              color: Colors.blue[600],
               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                print("pressed");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("OR SIGN UP WITH EMAIL", style: TextStyle(fontSize: 11.0, color: Colors.white, fontWeight: FontWeight.w100)),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey[700]),
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                hintStyle: TextStyle(color: Colors.grey[700]),
                hintText: "Password",
              ),
              obscureText: true
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              
              child: Text("Create Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              color: Colors.green,
               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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