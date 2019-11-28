class Caption {
  String caption;
  double confidence;

  Caption({this.caption, this.confidence});

  Caption.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['confidence'] = this.confidence;
    return data;
  }
}