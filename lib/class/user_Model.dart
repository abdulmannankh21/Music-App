class UserModel {
  String? uid;
  String? email;
  String? Name;

  UserModel({
    this.uid,
    this.email,
    this.Name,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      Name: map['Name'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'Name': Name,
    };
  }
}
