class GetDataModel {
  final id;
  final email;
  final first_name;
  final last_name;
  final avatar;

  GetDataModel(
      {this.id, this.email, this.first_name, this.last_name, this.avatar});

  factory GetDataModel.fromMap(Map<String, dynamic> map) {
    return GetDataModel(
      id: map['id'],
      email: map['email'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      avatar: map['avatar'],
    );
  }
}
