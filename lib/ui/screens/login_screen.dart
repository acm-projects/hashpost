import 'package:flutter/material.dart';
import 'package:hashpost/core/models/login_model.dart';
import 'package:hashpost/ui/widgets/user_base_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
              Hero(tag: "logo", child: Image.asset("assets/images/logo 2.png",)),
              SizedBox(height: 12.0,),
              Text("hashpost.",  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500)),
              Text("socials made easier.", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
              LoginWidget(),
              
              Container(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(fontSize: 11.0, color: Colors.grey)),
                    GestureDetector(
                      child: Text(" Let's make one!", style:TextStyle(color: Colors.redAccent, fontSize: 11.0), textAlign: TextAlign.left),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (BuildContext context) => CreateAccountScreen()),
                        // );
                      }
                    )
                  ]
                ),
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
    return UserBaseWidget<LoginModel>(
      builder: (context, model, user, child) => Container(
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
                onPressed: () async {
                  var success = await model.loginGoogleAuth();
                  if(success) {Navigator.pop(context);}
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("OR LOG IN WITH EMAIL", style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w100)),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).accentColor,
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey[700]),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).accentColor,
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
                
                child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                color: Colors.green,
                 padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () async {
                  print(_email.text);
                  print(_password.text);
                  var success = await model.loginEmailPassword(_email.text, _password.text);
                  if(success) {Navigator.pop(context);}
                },
              ),
            )
          ]
        )
      ),
    );
  }
}