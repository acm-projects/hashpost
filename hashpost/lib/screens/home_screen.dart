import 'package:flutter/material.dart';
import 'package:hashpost/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: Theme.of(context).textTheme.title),        
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.settings),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.perm_identity),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: MediaQuery.of(context).size.height/2.5,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom:20.0, left: 10.0, right: 2.0),
                  child: Container(
                    color: Color(0xffE3E4E6),
                    child: new ImageButton(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom:20.0, left: 2.0, right: 10.0),
                  child: Container(
                    color: Color(0xffE3E4E6),
                    child: new CameraButton(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(7.0),
            height: MediaQuery.of(context).size.height/2.5,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisCount: 3,
              //crossAxisSpacing: 10.0,
              children: <Widget>[
                PostTile(
                  side: MediaQuery.of(context).size.width/4,
                  child: Image.network("https://data.whicdn.com/images/327767201/superthumb.jpg?t=1552284504"),
                ),
                PostTile(
                  side: MediaQuery.of(context).size.width/4,
                  child: Image.network("https://i.ytimg.com/vi/oW_xiyNJg2w/hqdefault.jpg"),
                ),
                PostTile(
                  side: MediaQuery.of(context).size.width/4,
                  child: Image.network("https://i.imgur.com/t1LuvGZ.jpg"),
                ),
                PostTile(
                  side: MediaQuery.of(context).size.width/4,
                  child: Image.network("https://i.redd.it/qghnuxkd7r821.jpg"),
                ),
                PostTile(
                  side: MediaQuery.of(context).size.width/4,
                  child: Image.network("https://66.media.tumblr.com/1de8078095f6f18409bc0b32bba7e52a/tumblr_pmgxfnMPLk1ufzrtb_540.jpg"),
                ),
                PostTile(
                  side: MediaQuery.of(context).size.width/4,
                  child: Image.network("https://i.redd.it/4tjd030s3sg11.png"),
                ),
                PostTile(
                  side: MediaQuery.of(context).size.width/4,
                  child: Image.network("https://picsum.photos/200"),
                ),
                PostTile(
                  side: MediaQuery.of(context).size.width/4,
                  child: Image.network("https://picsum.photos/200"),
                ),
              ],
            )
          )
        ],
      )
    );
  }
}


class PostTile extends StatelessWidget {
  final double side;
  final Widget child;
  const PostTile({Key key, this.side = 20, this.child = const Icon(Icons.photo)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7.0),
      color: Color(0xffE3E4E6),
      height: side,
      width: side,
      child: GridTile(
        child: child,
      ),
    );
  }
}