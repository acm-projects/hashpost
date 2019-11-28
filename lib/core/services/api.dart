import 'package:dio/dio.dart';
import 'package:hashpost/core/objects/objects.dart';
import 'package:flutter/material.dart';

class Api {
  // api that our team made. these are the functions used to interact with them
  static final String _url = "https://hashpost.web.app/";
  final Dio _dio = Dio();
  
  // return predictionSuggestion to server
  void sendSuggestion(String predictionSuggestion) async {
    // send suggestion
    String _route = "/suggest";
    await Future.delayed(Duration(seconds: 3));
  }

  Future<ImagePost> postPicture(Image image) async {
    String _route = "/posts/image/";
    // POST to this
    await Future.delayed(Duration(seconds: 3));
  }

  Future<ImagePost> getPictureByID(String postID) async {
    String _route = "/posts/image/";
    // GET to this
  }

}