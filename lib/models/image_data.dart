
class ImageData {
  Result _result;
  Status _status;

  ImageData({Result result, Status status}) {
    this._result = result;
    this._status = status;
  }

  Result get result => _result;
  set result(Result result) => _result = result;
  Status get status => _status;
  set status(Status status) => _status = status;

  ImageData.fromJson(Map<String, dynamic> json) {
    _result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    _status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._result != null) {
      data['result'] = this._result.toJson();
    }
    if (this._status != null) {
      data['status'] = this._status.toJson();
    }
    return data;
  }
}

class Result {
  List<Tags> _tags;

  Result({List<Tags> tags}) {
    this._tags = tags;
  }

  List<Tags> get tags => _tags;
  set tags(List<Tags> tags) => _tags = tags;

  Result.fromJson(Map<String, dynamic> json) {
    if (json['tags'] != null) {
      _tags = new List<Tags>();
      json['tags'].forEach((v) {
        _tags.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._tags != null) {
      data['tags'] = this._tags.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  double _confidence;
  Tag _tag;

  Tags({double confidence, Tag tag}) {
    this._confidence = confidence;
    this._tag = tag;
  }

  double get confidence => _confidence;
  set confidence(double confidence) => _confidence = confidence;
  Tag get tag => _tag;
  set tag(Tag tag) => _tag = tag;

  Tags.fromJson(Map<String, dynamic> json) {
    _confidence = json['confidence'];
    _tag = json['tag'] != null ? new Tag.fromJson(json['tag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confidence'] = this._confidence;
    if (this._tag != null) {
      data['tag'] = this._tag.toJson();
    }
    return data;
  }
}

class Tag {
  String _en;

  Tag({String en}) {
    this._en = en;
  }

  String get en => _en;
  set en(String en) => _en = en;

  Tag.fromJson(Map<String, dynamic> json) {
    _en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this._en;
    return data;
  }
}

class Status {
  String _text;
  String _type;

  Status({String text, String type}) {
    this._text = text;
    this._type = type;
  }

  String get text => _text;
  set text(String text) => _text = text;
  String get type => _type;
  set type(String type) => _type = type;

  Status.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    data['type'] = this._type;
    return data;
  }
}
