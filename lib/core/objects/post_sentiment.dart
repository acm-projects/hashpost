class PostSentiment {
  double magnitude;
  double score;

  PostSentiment({this.magnitude, this.score});

  PostSentiment.fromJson(Map<String, dynamic> json) {
    magnitude = json['magnitude'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['magnitude'] = this.magnitude;
    data['score'] = this.score;
    return data;
  }
}