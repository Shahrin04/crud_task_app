class DataModel {
  String name;
  String job;

  DataModel({this.name, this.job});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "job": job,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      name: map["name"],
      job: map["job"],
    );
  }
}
