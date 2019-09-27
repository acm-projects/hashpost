import 'package:flutter/services.dart';
import 'package:flutter_tags/tag.dart' as fluttertags;
import 'package:flutter/material.dart';
import 'package:hashpost/functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hashpost/models/models.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditingScreen extends StatefulWidget {

  final picture;

  const EditingScreen({Key key, this.picture}) : super(key: key);

  @override
  _EditingScreenState createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {

  // dont need the loading, but use it for testing and debugging
  bool loading = true;
  ImageData imageData;

  @override
  void initState() {
    // TODO: implement initState
    getImageData();
    super.initState();
  }

  Future getImageData() async {
    imageData = await processImageDataFromFile(widget.picture);
    setState(() {
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return imageData == null ? EditingScreenLoading() : EditingScreenLoaded(imageData: imageData, image: widget.picture);
  }
}

// Screen shown while loading
class EditingScreenLoading extends StatelessWidget {
  const EditingScreenLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Theme.of(context).accentColor,
          size: 65.0,
        )
      ),
    );
  }
}

// Editing screen
class EditingScreenLoaded extends StatefulWidget {
  final ImageData imageData;
  final image;

  const EditingScreenLoaded({Key key, this.imageData, this.image}) : super(key: key);

  @override
  _EditingScreenLoadedState createState() => _EditingScreenLoadedState();
}

class _EditingScreenLoadedState extends State<EditingScreenLoaded> {

  List<String> tags = [];

  @override
  void initState() {
    // TODO: implement initState
    tags = widget.imageData.result.tags.map((t) => t.tag.en).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Photo", style: Theme.of(context).textTheme.title),   
        centerTitle: false,     
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // image
          Container(
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).accentColor, width: 5.0)
            ),
            child: Image.file(widget.image),
          ),
          // hashtag list
          Container(
            child: fluttertags.Tags(
              itemCount: tags.length,
              itemBuilder: (int index) {
                return fluttertags.ItemTags(
                  key: Key(index.toString()),
                  index: index,
                  title: "# " + tags[index].replaceAll(" ", "_"),
                  textStyle: TextStyle( fontSize: 14.0, ),
                  removeButton: fluttertags.ItemTagsRemoveButton(),
                  activeColor: Theme.of(context).accentColor,
                  pressEnabled: false,
                  onRemoved: (){
                    setState(() {
                      tags.removeAt(index); 
                    });
                  },
                );
              },
            ),
          ),
          // copy to clipboard button
          Container(
            margin: const EdgeInsets.all(15.0),
            width: MediaQuery.of(context).size.width,

            color: Theme.of(context).accentColor,
            child: FlatButton(
              onPressed: (){
                Clipboard.setData(new ClipboardData(text: tags.map((t) => "#"+t.replaceAll(" ", "_")).toList().join(" ")));
                Fluttertoast.showToast(
                  msg: "Copied #'s to Clipboard!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Theme.of(context).accentColor,
                  textColor: Theme.of(context).primaryColor,
                  fontSize: 16.0
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text("Copy Hashtags", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 23.0),),
              ),
            ),
          )
        ],
      ),
    );
  }
}