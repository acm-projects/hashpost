import 'package:hashpost/core/objects/objects.dart';

class ImagePost {
  String uid;
  String url;
  MLMetadata generationMetadata;
  List<Hashtag> hashtags;
  List<Caption> captions;
  String altText;
  PostSentiment sentiment;
  List<String> entities;
  List<String> stickers;

  ImagePost(
      {this.uid,
      this.url,
      this.generationMetadata,
      this.captions,
      this.altText,
      this.sentiment,
      this.entities,
      this.stickers});

  ImagePost.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    url = json['url'];
    generationMetadata = json['generationMetadata'] != null
        ? new MLMetadata.fromJson(json['generationMetadata'])
        : null;
    if (json['hashtags'] != null) {
      hashtags = new List<Hashtag>();
      json['hashtags'].forEach((v) {
        hashtags.add(new Hashtag.fromJson(v));
      });
    }
    if (json['captions'] != null) {
      captions = new List<Caption>();
      json['captions'].forEach((v) {
        captions.add(new Caption.fromJson(v));
      });
    }
    altText = json['altText'];
    sentiment = json['sentiment'];
    if (json['entities'] != null) {
      entities = new List<String>();
      json['entities'].forEach((v) {
        entities.add(v);
      });
    }
    if (json['stickers'] != null) {
      stickers = new List<String>();
      json['stickers'].forEach((v) {
        stickers.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['url'] = this.url;
    if (this.generationMetadata != null) {
      data['generationMetadata'] = this.generationMetadata.toJson();
    }
    if (this.hashtags != null) {
      data['hashtags'] = this.hashtags.map((v) => v.toJson()).toList();
    }
    if (this.captions != null) {
      data['captions'] = this.captions.map((v) => v.toJson()).toList();
    }
    data['altText'] = this.altText;
    data['sentiment'] = this.sentiment;
    if (this.entities != null) {
      data['entities'] = this.entities.toList();
    }
    if (this.stickers != null) {
      data['stickers'] = this.stickers.toList();
    }
    return data;
  }
}
