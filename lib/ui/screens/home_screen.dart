import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hashpost/core/models/home_model.dart';
import 'package:hashpost/core/objects/objects.dart';
import 'package:hashpost/core/objects/text_post.dart';
import 'package:hashpost/core/services/services.dart';
import 'package:hashpost/locator.dart';
import 'package:hashpost/ui/screens/screens.dart';
import 'package:hashpost/ui/size_config.dart';
import 'package:hashpost/ui/theme/theme_data.dart';
import 'package:hashpost/ui/widgets/graph_widget.dart';
import 'package:hashpost/ui/widgets/user_base_widget.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {   

    SizeConfig().init(context); 
    return UserBaseWidget<HomeModel>(
      builder: (context, model, user, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor, 
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(0.0),
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                }              
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.1),
              child: (user == null) ? IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                }
              ) : IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  locator<Auth>().signOut();
                  Navigator.pushNamed(context, '/login');
                }, 
              )
            )
          ],
        ),
        floatingActionButton: UnicornDialer(
          // backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: [
            UnicornButton(
              currentButton: FloatingActionButton(
                heroTag: "camera",
                backgroundColor: Colors.greenAccent,
                mini: true,
                child: Image.asset("assets/images/Group 4@2x.png"),
                onPressed: () async {
                  var image = await model.fetchImageUsingCamera();
                  if(image != null) {
                    print("Successfully got photo from camera");
                  }
                },)),
            // camera roll
            UnicornButton(
              currentButton: FloatingActionButton(
                heroTag: "photos",
                backgroundColor: Colors.greenAccent,
                mini: true,
                child: Image.asset("assets/images/Group 5@2x.png"),
                onPressed: () async {
                  var image = await model.fetchImageUsingCameraRoll();
                  if(image != null) {
                    print("Successfully got photo from camera roll");
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditingScreen(image: image)));
                  }
                },)),
            // instagram
            UnicornButton(
              currentButton: FloatingActionButton(
                heroTag: "instagram",
                backgroundColor: Colors.blueAccent,
                mini: true,
                child: Image.asset("assets/images/Group@2x.png"),
                onPressed: () {},)),
            // facebook
            UnicornButton(
              currentButton: FloatingActionButton(
                heroTag: "facebook",
                backgroundColor: Colors.greenAccent,
                mini: true,
                child: Image.asset("assets/images/Group 3@2x.png"),
                onPressed: () {},)),
            // twitter
            UnicornButton(
              currentButton: FloatingActionButton(
                heroTag: "twitter",
                backgroundColor: Colors.greenAccent,
                mini: true,
                child: Image.asset("assets/images/Group 2@2x.png"),
                onPressed: () {},)),
          ]
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(tag: "logo", child: Image.asset("assets/images/logo 2.png")),
              SizedBox(height: 12.0,),
              Text("hashpost.",  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500)),
              SizedBox(height: 5.0,),
              Text((user == null) ? "You should sign in!" : (user.displayName != null) ? "Welcome, ${user.displayName}!" : "Welcome home, user!",  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w100)),
              // ImageOptions()
              // ListView.builder()
              // SizedBox(
              //   width: 200.0,
              //   height: 100.0,
              //   child: Shimmer.fromColors(
              //     baseColor: Theme.of(context).accentColor,
              //     highlightColor: Colors.red[300],
              //     child: Text(
              //       'Shimmer',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 40.0,
              //         fontWeight:
              //         FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // )
              SizedBox(
                height: 20.0,
              ),
              // label (Image Posts)
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                child: Text("Image Posts", style: TextStyle(
                  fontSize: 22.0, 
                  fontWeight: FontWeight.w500
                ),)
              ),
              // listview for image posts
              SizedBox(
                height: SizeConfig.screenHeight/3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: ImageHomePost(
                        url: "https://cdn.pixabay.com/photo/2014/09/27/17/30/kuang-si-falls-463925__340.jpg",
                        caption: "The nature here is absolutely stunning!",
                        hashtags: ["nature", "naturalbeauty", "waterfall", "photography"],
                        obscenity: 0.1,
                        sentiment: 0.9,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: ImageHomePost(
                        url: "https://wordpress.accuweather.com/wp-content/uploads/2019/03/crater-lake-snow.jpg",
                        caption: "It's freezing where I am right now.",
                        hashtags: ["snow", "winter", "blizzard", "cozy"],
                        obscenity: 0.0,
                        sentiment: 0.7,
                      ),
                    ),
                  ]
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              // label (Text Posts)
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                child: Text("Text Posts", style: TextStyle(
                  fontSize: 22.0, 
                  fontWeight: FontWeight.w500
                ),)
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextHomePost(
                        caption: "Focused on getting good grades!",
                        hashtags: ["school", "deadlines", "exams", "midterms"],
                        obscenity: 0.0,
                        sentiment: 0.6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextHomePost(
                        caption: "This alleyway is very narrow on this side.",
                        hashtags: ["city", "urban", "alley", "night_way", "city"],
                        obscenity: 0.4,
                        sentiment: 0.7,
                      ),
                    ),
                  ]
                ),
              ),
            ],
          )          
        ),
      ),
    );
  }
}

class TextHomePost extends StatelessWidget {
  final HomeModel model;
  final String caption;
  final List<String> hashtags;
  final double obscenity;
  final double sentiment;
  
  TextHomePost({Key key, this.model, this.caption, this.hashtags, this.obscenity, this.sentiment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).accentColor,
      constraints: BoxConstraints(
        minWidth: 225.0,
        maxWidth: 225.0,
        minHeight: 100.0,
        maxHeight: 100.0,
      ),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(12.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0, bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // date
                          Text("Nov 10, 2019 | ❤️", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                          SizedBox(height: 4.0,),
                          // caption + hashtags
                          Wrap(
                            children: <Widget>[
                              Text(caption, maxLines: 2, overflow: TextOverflow.ellipsis),
                              ...hashtags.map((ht) => GestureDetector(
                                onLongPress: () {
                                  print("that was a long press");
                                },
                                child: Text(
                                  "#$ht ", 
                                  style: TextStyle(
                                    color: Colors.red[900], 
                                  )
                                ),
                              )).toList()
                            ],
                          ),
                          // measurements
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                // obscenity
                                Container(
                                  child: LinearPercentIndicator(
                                    leading: Container(margin: EdgeInsets.only(top: 5.0, right: 6.0), child: Text("Obscenity", style: TextStyle(color: Colors.grey, fontSize: 10.0),)),
                                    // leading: Container(height: 5,),
                                    percent: obscenity,
                                    padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 3.0),
                                    animation: true,
                                    animateFromLastPercent: true,
                                    animationDuration: 500,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    linearGradient: LinearGradient(
                                      colors: [
                                        HashPostTheme.primaryColorOne,
                                        HashPostTheme.primaryColorTwo
                                      ]
                                    ),
                                  ),
                                ),
                                // sentiment
                                Container(
                                  child: LinearPercentIndicator(
                                    leading: Container(margin: EdgeInsets.only(top: 5.0, right: 6.0), child: Text("Sentiment", style: TextStyle(color: Colors.grey, fontSize: 10.0),)),
                                    percent: sentiment,
                                    padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 3.0),
                                    animation: true,
                                    animateFromLastPercent: true,
                                    animationDuration: 500,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    linearGradient: LinearGradient(
                                      colors: [
                                        HashPostTheme.primaryColorOne,
                                        HashPostTheme.primaryColorTwo
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            )
          ],
        ),
      )
      
    );
  }
}


class ImageHomePost extends StatelessWidget {
  final ImagePost imagePost;
  final HomeModel model;
  final url;
  final String caption;
  final List<String> hashtags;
  final double obscenity;
  final double sentiment;

  ImageHomePost({Key key, this.imagePost, this.model, this.url, this.hashtags, this.caption, this.obscenity, this.sentiment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).accentColor,
      constraints: BoxConstraints(
        minWidth: 225.0,
        maxWidth: 225.0,
        minHeight: SizeConfig.screenHeight/3,
        maxHeight: SizeConfig.screenHeight/3,
      ),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(12.0),
        child: Stack(
          children: <Widget>[
            // background
            Positioned.fill(
              child: Image.network(
                url, 
                fit: BoxFit.cover, 
                alignment: Alignment.center,
              )
            ),
            // bottom container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0, bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // date
                          Text("Nov 10, 2019 | ❤️", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                          SizedBox(height: 4.0,),
                          // caption + hashtags
                          Wrap(
                            children: <Widget>[
                              Text(caption, maxLines: 2, overflow: TextOverflow.ellipsis),
                              ...hashtags.map((ht) => GestureDetector(
                                onLongPress: () {
                                  List<Color> gradientColors = [
                                    HashPostTheme.primaryColorOne,
                                    HashPostTheme.primaryColorTwo
                                  ];
                                  slideDialog.showSlideDialog(
                                    context: context,
                                    backgroundColor: Theme.of(context).accentColor,
                                    pillColor: Theme.of(context).primaryColor,
                                    child: GraphWidget()
                                  );
                                },
                                child: Text(
                                  "#$ht ", 
                                  style: TextStyle(
                                    color: Colors.red[900], 
                                  )
                                ),
                              )).toList()
                            ],
                          ),
                          // measurements
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                // obscenity
                                Container(
                                  child: LinearPercentIndicator(
                                    leading: Container(margin: EdgeInsets.only(top: 5.0, right: 6.0), child: Text("Obscenity", style: TextStyle(color: Colors.grey, fontSize: 10.0),)),
                                    // leading: Container(height: 5,),
                                    percent: obscenity,
                                    padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 3.0),
                                    animation: true,
                                    animateFromLastPercent: true,
                                    animationDuration: 500,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    linearGradient: LinearGradient(
                                      colors: [
                                        HashPostTheme.primaryColorOne,
                                        HashPostTheme.primaryColorTwo
                                      ]
                                    ),
                                  ),
                                ),
                                // sentiment
                                Container(
                                  child: LinearPercentIndicator(
                                    leading: Container(margin: EdgeInsets.only(top: 5.0, right: 6.0), child: Text("Sentiment", style: TextStyle(color: Colors.grey, fontSize: 10.0),)),
                                    percent: sentiment,
                                    padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 3.0),
                                    animation: true,
                                    animateFromLastPercent: true,
                                    animationDuration: 500,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    linearGradient: LinearGradient(
                                      colors: [
                                        HashPostTheme.primaryColorOne,
                                        HashPostTheme.primaryColorTwo
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            )
          ],
        ),
      )
      
    );
  }
}



// ! ADD A GENERATE FROM URL OPTION
// class ImageOptions extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeModel>(
//       builder: (context, model, child) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Padding(padding: EdgeInsets.all(20.0),),
//           HomeOption(
//             "assets/images/Group 4@2x.png", 
//             "TAKE PHOTO",
//             callback: () async {
//               var image = await model.fetchImageUsingCamera();
//               if(image != null) {
//                 print("Successfully got photo from camera");
//               }
//             },
//           ), 
//           Padding(padding: EdgeInsets.all(12.0),),
//           HomeOption(
//             "assets/images/Group 5@2x.png", 
//             "CAMERA ROLL",
//             callback: () async {
//               var image = await model.fetchImageUsingCameraRoll();
//               if(image != null) {
//                 print("Successfully got photo from camera roll");
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditingScreen(image: image)));
//               }
//             },
//           ), 
//           Padding(padding: EdgeInsets.all(12.0),),
//           HomeOption(
//             "assets/images/Group@2x.png", 
//             "INSTAGRAM",
//             callback: () {
//               print("We haven't implemented instagram yet");
//             },
//           ), 
//           Padding(padding: EdgeInsets.all(12.0),),
//           HomeOption(
//             "assets/images/Group 3@2x.png", 
//             "FACEBOOK",
//             callback: () {
//               print("We haven't implemented facebook yet");
//             },
//           ), 
//           Padding(padding: EdgeInsets.all(12.0),),
//           HomeOption(
//             "assets/images/Group 2@2x.png", 
//             "TWITTER",
//             callback: () {
//               print("We haven't implemented twitter yet");
//             }
//           ), 
//         ],
//       ),
//     );
//   }
// }


// class HomeOption extends StatelessWidget {
//   final String path;
//   final String title;
//   final Function callback;
//   const HomeOption(this.path, this.title, {this.callback});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: callback,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Image.asset(path, width:50.0, height:50.0),
//           SizedBox(width: 13.0,),
//           Text(title,)
//         ], 
//       ),
//     );
//   }
// }