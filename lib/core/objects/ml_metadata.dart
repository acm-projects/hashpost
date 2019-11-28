class MLMetadata {
  String datasetBatch;
  int generatedModelVersion;
  double generationDate;

  MLMetadata(
      {this.datasetBatch, this.generatedModelVersion, this.generationDate});

  MLMetadata.fromJson(Map<String, dynamic> json) {
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