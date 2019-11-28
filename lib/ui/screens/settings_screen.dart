import 'package:flutter/material.dart';
import 'package:hashpost/ui/theme/theme_data.dart';

import '../../locator.dart';

class SettingsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back,),
                onPressed: () { 
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        
        centerTitle: true,
        // title: Text("Settings", textAlign: TextAlign.left,),
        title: Hero(tag: "logo", child: Image.asset("assets/images/logo.png"))
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[ 
                SettingCategory(
                  categoryIcon: Icons.person_outline,
                  categoryTitle: "Account",
                  settings: <Widget>[
                    RegularSetting(
                      title: "Edit Account",
                      callback: () {print("clicked on edit account");},
                    ),
                    RegularSetting(
                      title: "Reset Password",
                      callback: () {print("clicked on reset password");},
                    ),
                    RegularSetting(
                      title: "Clear Cache",
                      callback: () {print("cleared cache");},
                    ),
                  ],
                ),
                SettingCategory(
                  categoryIcon: Icons.format_paint,
                  categoryTitle: "Appearance",
                  settings: <Widget>[
                    IOSetting(
                      title: "Dark Theme",
                      defaultValue: Theme.of(context).brightness == Brightness.dark,
                      onCallback: () {locator<HashPostTheme>().changeToDark();},
                      offCallback: () {locator<HashPostTheme>().changeToLight();}
                    ),
                  ],
                ),
                SettingCategory(
                  categoryIcon: Icons.location_on,
                  categoryTitle: "Location",
                  settings: <Widget>[
                    IOSetting(
                      title: "Current Location",
                      defaultValue: false,
                      onCallback: () {print("it is on");},
                      offCallback: () {print("it is off");}
                    ),
                  ],
                ),
                
                // this is so that the last settings dont get
                // covered by the apply button (like padding)
                SizedBox(height: 150.0,)
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ApplyButton(),
            ),
          )
        ]
      )
    );
  }
}

// apply button
class ApplyButton extends StatelessWidget {
  const ApplyButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            gradient: LinearGradient(
              colors: [
                HashPostTheme.primaryColorOne,
                HashPostTheme.primaryColorTwo
              ],
            )
          ),
          child: Text("Apply Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
        ),
        onTap: () {
          // Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (BuildContext context) => EditingScreen()),
          //     );
        },
      );
  }
}

// setting category
class SettingCategory extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryTitle;
  final List<Widget> settings;
  const SettingCategory({Key key, this.categoryIcon, this.categoryTitle, this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Icon(categoryIcon, size: 30.0,),
                Text(" " + categoryTitle, style: TextStyle(fontSize: 20.0),)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 30.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: settings.map((s) {
                bool isLast = settings.indexOf(s) == settings.length-1;
                return isLast ? Padding(child: s, padding: EdgeInsets.symmetric(vertical: 15.0)) 
                : Column(children: [Padding(child: s, padding: EdgeInsets.symmetric(vertical: 15.0)), Divider(color: Theme.of(context).primaryColor, thickness: 1.5,)]);
              }).toList()
            ),
          )
        ]
      )
    );
  }
}

// types of settings
class IOSetting extends StatefulWidget {
  final String title;
  final Function onCallback;
  final Function offCallback;
  final bool defaultValue;
  const IOSetting({Key key, this.title, this.onCallback, this.offCallback, this.defaultValue = false}) : super(key: key);

  @override
  _IOSettingState createState() => _IOSettingState();
}
class _IOSettingState extends State<IOSetting> {

  bool isOn;
  double _textSize = 18.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isOn = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(widget.title, style: TextStyle(fontSize: _textSize),),
        GestureDetector(
          onTap: () {
            setState(() {
              isOn = false;
              widget.offCallback();
            });
          },
          child: isOn ? Text("On", style: TextStyle(color: HashPostTheme.primaryColorTwo, fontSize: _textSize),) 
          : GestureDetector(
          onTap: () {
            setState(() {
              isOn = true;
              widget.onCallback();
            });
          }, child: Text("Off", style: TextStyle(color: Colors.grey, fontSize: _textSize),),)
        )
      ],
    );
  }
}

class RegularSetting extends StatelessWidget {
  final String title;
  final Function callback;
  const RegularSetting({Key key, this.title, this.callback}) : super(key: key);

  final double _textSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: _textSize)),
        GestureDetector(
          onTap: callback,
          child: Icon(Icons.arrow_forward_ios),
        ) 
      ]
    );
  }
}