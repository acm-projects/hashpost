class Hashtag {
  String hashtag;
  double confidence;

  Hashtag({this.hashtag, this.confidence});

  Hashtag.fromJson(Map<String, dynamic> json) {
    hashtag = json['hashtag'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hashtag'] = this.hashtag;
    data['confidence'] = this.confidence;
    return data;
  }
}