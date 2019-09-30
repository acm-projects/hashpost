import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hashpost/screens/screens.dart';
import 'package:image_picker/image_picker.dart';

class CameraButton extends StatefulWidget {
  const CameraButton({
    Key key,
  }) : super(key: key);

  @override
  _CameraButtonState createState() => _CameraButtonState();
}
class _CameraButtonState extends State<CameraButton> {
  // image file
  File _image;

  Future getPic() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditingScreen(picture: image,)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: getPic,
      child: Center(
        child: Icon(Icons.camera, size: 100.0,),
      ),
    );
  }
}
