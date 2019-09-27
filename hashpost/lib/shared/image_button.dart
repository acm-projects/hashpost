import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hashpost/screens/screens.dart';
import 'package:image_picker/image_picker.dart';

class ImageButton extends StatefulWidget {
  const ImageButton({Key key,}) : super(key: key);

  @override
  _ImageButtonState createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  File _image;
  // for images
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if(image != null) {
      setState(() {
        _image = image;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditingScreen(picture: image,)),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: getImage,
      child: Center(
        child: Icon(Icons.add, size: 100.0,),
      ),
    );
  }
}
