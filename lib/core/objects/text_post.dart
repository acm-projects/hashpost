
import 'package:hashpost/core/objects/objects.dart';

class TextPost {
  String uid;
  String owner;
  MLMetadata generationMetadata;
  List<Caption> captions;
  List<Hashtag> hashtags;
  PostSentiment sentiment;
  List<String> entities;

  TextPost(
      {this.uid,
      this.owner,
      this.generationMetadata,
      this.captions,
      this.hashtags,
      this.sentiment,
      this.entities});

  TextPost.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    owner = json['owner'];
    generationMetadata = json['generationMetadata'] != null
        ? new MLMetadata.fromJson(json['generationMetadata'])
        : null;
    if (json['captions'] != null) {
      captions = new List<Caption>();
      json['captions'].forEach((v) {
        captions.add(new Caption.fromJson(v));
      });
    }
    if (json['hashtags'] != null) {
      hashtags = new List<Hashtag>();
      json['hashtags'].forEach((v) {
        hashtags.add(new Hashtag.fromJson(v));
      });
    }
    sentiment = json['sentiment'];
    entities = json['entities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['owner'] = this.owner;
    if (this.generationMetadata != null) {
      data['generationMetadata'] = this.generationMetadata.toJson();
    }
    if (this.captions != null) {
      data['captions'] = this.captions.map((v) => v.toJson()).toList();
    }
    if (this.hashtags != null) {
      data['hashtags'] = this.hashtags.map((v) => v.toJson()).toList();
    }
    data['sentiment'] = this.sentiment;
    data['entities'] = this.entities;
    return data;
  }
}

class GenerationMetadata {
  String datasetBatch;
  int generatedModelVersion;
  int generationDate;

  GenerationMetadata(
      {this.datasetBatch, this.generatedModelVersion, this.generationDate});

  GenerationMetadata.fromJson(Map<String, dynamic> json) {
    datasetBatch = json['datasetBatch'];
    generatedModelVersion = json['generatedModelVersion'];
    generationDate = json['generationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datasetBatch'] = this.datasetBatch;
    data['generatedModelVersion'] = this.generatedModelVersion;
    data['generationDate'] = this.generationDate;
    return data;
  }
}