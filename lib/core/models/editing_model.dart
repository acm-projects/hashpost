import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hashpost/core/models/base_model.dart';
import 'package:hashpost/core/objects/objects.dart';
import 'package:hashpost/core/services/services.dart';
import 'package:hashpost/locator.dart';

class EditingModel extends BaseModel {

  Api _api = locator<Api>();

  ImagePost _imagePost;
  List<String> tags = [];
  String explicitText = "Not Explicit";
  String sentimentText = "Very Positive";
  BoxDecoration unselectedDecoration;
  BoxDecoration selectedDecoration;

  ImagePost get imagePost => _imagePost;

  

  Future<ImagePost> fetchImagePost(Image image) async {
    updateState(ViewState.Busy);
    _imagePost = await  _api.postPicture(image);
    if(_imagePost.sentiment.score < 0.35) {
      sentimentText = "Negative";
    } else if(_imagePost.sentiment.score >= 0.35 && _imagePost.sentiment.score < 0.70) {
      sentimentText = "Neutral";
    } else {
      sentimentText = "Positive";
    }
    updateState(ViewState.Idle);
    return _imagePost;
  }
  Future<List<String>> getTags() async {
    updateState(ViewState.Busy);
    // tags = ["nature", "natural_beauty", "photography", "perfect_shots"];
    tags = ["fashion", "crocsandsocks", "crocs", "weird"];
    await Future.delayed(Duration(seconds: 4));
    updateState(ViewState.Idle);
    return tags;
  }
  void removeTag(int index) {
    tags.removeAt(index); 
    notifyListeners();
  }
}