import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tags/tag.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hashpost/core/models/base_model.dart';
import 'package:hashpost/core/models/editing_model.dart';
import 'package:hashpost/ui/size_config.dart';
import 'package:hashpost/ui/theme/theme_data.dart';
import 'package:hashpost/ui/widgets/base_widget.dart';
import 'package:hashpost/ui/widgets/graph_widget.dart';
import 'package:hashpost/ui/widgets/user_base_widget.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class EditingScreen extends StatefulWidget {

  final Image image;

  const EditingScreen({Key key, this.image}) : super(key: key);

  @override
  _EditingScreenState createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  
  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
    return UserBaseWidget<EditingModel>(
      onModelReady: (model) {
        model.getTags();
      },
      builder: (context, model, user, child) {
        switch(model.state) {
          case ViewState.NoConnection:
            return Container();
            break;
          case ViewState.Busy:
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Center(
                child: LoadingBouncingGrid.square(
                  backgroundColor: Color(0xffEE3B53),
                  size: 80.0,
                  inverted: true,
                )
              ),
            );
            break;
          case ViewState.Idle:
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(90),
                child: AppBar(
                  leading: Container(),
                  elevation: 0.0,
                  backgroundColor: Theme.of(context).primaryColor,
                  flexibleSpace: Align(
                    alignment: Alignment.center, 
                    child: SafeArea(
                      child: Hero(
                        tag: "logo",
                        child: Image.asset(
                          'assets/images/logo.png', 
                          height: 65,
                        ),
                      ),
                    )
                  ),
                  centerTitle: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(15),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                        child: GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.arrow_back_ios, size: 17,),
                              Text(" BACK", style: TextStyle(fontSize: 17),)
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    
                    ),
                  ),
                ),
              ),
              body: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topCenter,
                          constraints: BoxConstraints(
                            maxWidth: SizeConfig.screenWidth,
                            minWidth: SizeConfig.screenWidth,
                            minHeight: SizeConfig.screenHeight/5,
                            maxHeight: SizeConfig.screenHeight/4
                          ),
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            color:Theme.of(context).primaryColor,
                            border: Border(bottom: BorderSide(width: 5, color: Color(0xffEE3B53)), top: BorderSide(width: 5, color: Color(0xffEE3B53))),
                          ),
                          child: Center(child: widget.image),
                        ),
                        // tags
                        Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 23.0, right: 23.0, top: 14.0),
                              child: Column(
                                children: <Widget>[
                                  new CaptionContainer(text: "A pair of cool shoes"),
                                  SizedBox(height: 10,),
                                  new CaptionContainer(text: "Two grass-covered rocks"),
                                ],
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                minHeight: SizeConfig.screenHeight/6
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                              child: Tags(
                                itemCount: model.tags.length+2,
                                runSpacing: 10,
                                itemBuilder: (int index) {                            
                                  if(index == 0) {
                                    return GestureDetector(
                                      onTap: () {
                                        model.getTags();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              HashPostTheme.primaryColorOne,
                                              HashPostTheme.primaryColorTwo
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                        padding: const EdgeInsets.all(6),
                                        child: Icon(Icons.replay, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
                                        
                                      ),
                                    );
                                  } 
                                  else if(index == 1) {
                                    return GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(
                                          new ClipboardData(
                                            text: model.tags.map((s) => ("#" + s.replaceAll(" ", "_"))).join(" ")));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              HashPostTheme.primaryColorOne,
                                              HashPostTheme.primaryColorTwo
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                        padding: const EdgeInsets.all(6),
                                        child: Icon(Icons.content_copy, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
                                        
                                      ),
                                    );
                                  }
                                  int newIndex = index - 2;
                                  return ItemTags(
                                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 6.0, right: 13.0),
                                    elevation: 0.0,
                                    key: Key(newIndex.toString()),
                                    textColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                    index: newIndex,
                                    title: "#" + model.tags[newIndex].replaceAll(" ", "_") + "    ",
                                    textStyle: TextStyle( fontSize: 15.0, fontWeight: FontWeight.w300),
                                    removeButton: ItemTagsRemoveButton(
                                      backgroundColor: Theme.of(context).primaryColor,
                                      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black
                                    ),
                                    activeColor: Theme.of(context).accentColor,
                                    // pressEnabled: false,
                                    active: true,
                                    color: Theme.of(context).accentColor,

                                    onLongPressed: (tag) {
                                      print("reached long press");
                                      slideDialog.showSlideDialog(
                                        context: context,
                                        backgroundColor: Theme.of(context).accentColor,
                                        pillColor: Theme.of(context).primaryColor,
                                        child: GraphWidget(hashtag: tag.title,)
                                      );
                                    },
                                    onRemoved: (){
                                      setState(() {
                                        model.removeTag(newIndex);
                                      });
                                    },
                                  );
                                }
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SleekCircularSlider(
                                    initialValue: 73,
                                    appearance: CircularSliderAppearance(
                                      customWidths: CustomSliderWidths(
                                        trackWidth: 4,
                                        shadowWidth: 0,
                                      ),
                                      infoProperties: InfoProperties(
                                        topLabelText: model.sentimentText,
                                        modifier: (num) {return '${num.toStringAsFixed(1)}%';},
                                        mainLabelStyle: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, fontSize: 25.0)
                                      ),
                                      customColors: CustomSliderColors(
                                        progressBarColors: [
                                          HashPostTheme.primaryColorTwo,
                                          HashPostTheme.primaryColorOne,
                                        ],
                                        shadowColor: HashPostTheme.primaryColorOne,
                                        trackColor: Theme.of(context).accentColor,
                                      )
                                    ),
                                  ),
                                  SleekCircularSlider(
                                    initialValue: 4,
                                    appearance: CircularSliderAppearance(
                                      customWidths: CustomSliderWidths(
                                        trackWidth: 3,
                                        shadowWidth: 0,
                                      ),
                                      infoProperties: InfoProperties(
                                        topLabelText: model.explicitText,
                                        modifier: (num) {return '${num.toStringAsFixed(1)}%';},
                                        mainLabelStyle: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, fontSize: 25.0)
                                      ),
                                      customColors: CustomSliderColors(
                                        progressBarColors: [
                                          HashPostTheme.primaryColorTwo,
                                          HashPostTheme.primaryColorOne,
                                        ],
                                        shadowColor: HashPostTheme.primaryColorOne,
                                        trackColor: Theme.of(context).accentColor,
                                      )
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 100,)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,  
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: new CopyButton(),
                  ),
                ],
              ),
            );
            break;
        }
      }
    );
  }
}

class CaptionContainer extends StatelessWidget {
  final String text;
  const CaptionContainer({
    this.text, Key key}
  );

  final bool selected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      decoration: !selected ? BoxDecoration(
        color: Theme.of(context).accentColor
      ) : BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: HashPostTheme.primaryColorOne,
          width: 3.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 14.0),
        child: Text("\"$text\"", 
          maxLines: 2, 
          overflow: TextOverflow.ellipsis, 
          style: TextStyle( 
            fontSize: 15.0, 
            fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}


class CopyButton extends StatelessWidget {
  const CopyButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<EditingModel>(
      builder: (context, model, child) => GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [
                HashPostTheme.primaryColorOne,
                HashPostTheme.primaryColorTwo
              ],
            )
          ),
          child: Text("Copy to clipboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
        ),
        onTap: () {
          // var string = model.imagePost.captions[0].caption + model.tags.map((s) => ("#" + s.replaceAll(" ", "_"))).join(" ");
        var string = model.tags.map((s) => ("#" + s.replaceAll(" ", "_"))).join(" ");
         Clipboard.setData(
            new ClipboardData(
              text: string
            )
          );
          Fluttertoast.showToast(
            msg: "Copied text!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Theme.of(context).accentColor,
            textColor: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : Colors.black,
            fontSize: 16.0
          );
        },
      ),
    );
  }
}