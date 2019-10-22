import 'package:flutter/material.dart';


class SettingsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text("Settings", textAlign: TextAlign.left)
        ),
        body: Column(
          children: <Widget>[ ListTile(
            title: Text("Username"),
            subtitle: Text("name goes here"),
            onTap: (){},
          ),
          ListTile(
            title: Text("Password"),
            onTap: (){},
          ),
          ListTile(
            title: Text("Notifications"),
            onTap: (){},
        ),
        ])
        
        
    );
  }

}