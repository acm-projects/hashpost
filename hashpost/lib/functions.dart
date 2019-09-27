import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hashpost/models/models.dart';

Future processImageDataFromFile(image) async {

  const apiKey = "acc_03896851eaae961";
  const apiSecret = "4103585dff71fa4a26fb92a7bc0129ef";

  var str = apiKey + ":" + apiSecret;
  var bytes = utf8.encode(str);
  var base64Str = base64.encode(bytes);

  var dio = Dio();

  FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path,filename: "image"),
      "limit": 10,
    });
  
  try {
    Response response = await dio.post(
      "https://api.imagga.com/v2/tags",
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Basic " + base64Str,
        }
      )
    );
    if(response != null) {
      print(response.data);
      return ImageData.fromJson(response.data);
    } else {
      print("this aint working");
    }
  } catch (e) {
    print(e);
  }
}