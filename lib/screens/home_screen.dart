// import 'package:flutter/material.dart';
// import 'package:hashpost/screens/login_screen.dart';
// import 'package:hashpost/screens/screens.dart';
// import 'package:hashpost/screens/settings_screen.dart';
// import 'package:hashpost/shared/shared.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home", style: Theme.of(context).textTheme.title),        
//         elevation: 0.0,
//         actions: <Widget>[
//           Padding(
//              padding: const EdgeInsets.all(0.5),
//             child: IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (BuildContext context) => SettingsScreen()),
//                 );
//               }
//             ),
            
//           ),
//           Padding(
//             padding: const EdgeInsets.all(0.5),
//             child: IconButton(
//               icon: Icon(Icons.perm_identity),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
//                 );
//               }
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Theme.of(context).primaryColor,
//       body: Column(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 12.0),
//             height: MediaQuery.of(context).size.height/2.5,
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0, bottom:20.0, left: 10.0, right: 2.0),
//                   child: Container(
//                     color: Color(0xffE3E4E6),
//                     child: new ImageButton(),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0, bottom:20.0, left: 2.0, right: 10.0),
//                   child: Container(
//                     color: Color(0xffE3E4E6),
//                     child: new CameraButton(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(7.0),
//             height: MediaQuery.of(context).size.height/2.5,
//             width: MediaQuery.of(context).size.width,
//             child: GridView.count(
//               crossAxisCount: 3,
//               //crossAxisSpacing: 10.0,
//               children: <Widget>[
//                 PostTile(
//                   side: MediaQuery.of(context).size.width/4,
//                   child: Image.network("https://data.whicdn.com/images/327767201/superthumb.jpg?t=1552284504"),
//                 ),
//                 PostTile(
//                   side: MediaQuery.of(context).size.width/4,
//                   child: Image.network("https://i.ytimg.com/vi/oW_xiyNJg2w/hqdefault.jpg"),
//                 ),
//                 PostTile(
//                   side: MediaQuery.of(context).size.width/4,
//                   child: Image.network("https://i.imgur.com/t1LuvGZ.jpg"),
//                 ),
//                 PostTile(
//                   side: MediaQuery.of(context).size.width/4,
//                   child: Image.network("https://i.redd.it/qghnuxkd7r821.jpg"),
//                 ),
//                 PostTile(
//                   side: MediaQuery.of(context).size.width/4,
//                   child: Image.network("https://66.media.tumblr.com/1de8078095f6f18409bc0b32bba7e52a/tumblr_pmgxfnMPLk1ufzrtb_540.jpg"),
//                 ),
//                 PostTile(
//                   side: MediaQuery.of(context).size.width/4,
//                   child: Image.network("https://i.redd.it/4tjd030s3sg11.png"),
//                 ),
//                 PostTile(
//                   side: MediaQuery.of(context).size.width/4,
//                   child: Image.network("https://picsum.photos/200"),
//                 ),
//                 PostTile(
//                   side: MediaQuery.of(context).size.width/4,
//                   child: Image.network("https://picsum.photos/200"),
//                 ),
//               ],
//             )
//           )
//         ],
//       )
//     );
//   }
// }


// class PostTile extends StatelessWidget {
//   final double side;
//   final Widget child;
//   const PostTile({Key key, this.side = 20, this.child = const Icon(Icons.photo)}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(7.0),
//       color: Color(0xffE3E4E6),
//       height: side,
//       width: side,
//       child: GridTile(
//         child: child,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,   
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
                );
              },
            ),]
      ),
      body: Container(
        alignment: Alignment.center,
       //padding: EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/logo 2.png"),
            Text("hashpost.",  style: TextStyle(color: Colors.white, fontSize: 30.0, )),
            Text("socials made easier",  style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w100)),
          ],
          )
         

      )
    );
  }
}