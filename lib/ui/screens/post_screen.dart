import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class PostScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(        
      backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: Image.asset('assets/images/logo.png'),
          leading: Builder(
              builder: (BuildContext context) {
                return 
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: () { 
                    Navigator.pop(context);
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),

          // centerTitle: true,
          // title: Text("Settings", textAlign: TextAlign.left, style: TextStyle(color: Colors.white),),
        ),
        
        body:Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                color: Colors.grey[900],
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.width/1.5,
                      minHeight: MediaQuery.of(context).size.width/1.5
                    ),
                    child: Image.asset("assets/images/puppy1.jpg", fit: BoxFit.contain,),
                  ),
                )
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(25.0),
              //child: new CopyButton(),
            ),
          ]
        )
      );
  }
}

// class CopyButton extends StatelessWidget {
//   const CopyButton({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20.0),
//             gradient: LinearGradient(
//               colors: [
//                 Colors.deepOrange,
//                 Colors.red,
//                 Colors.red[700]
//               ],
//             )
//           ),
//           child: Text("Copy to clipboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//           padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
//         ),
//         onTap: () {
//           // Navigator.push(
//           //       context,
//           //       MaterialPageRoute(builder: (BuildContext context) => EditingScreen()),
//           //     );
//         },
//       );
//   }
// }