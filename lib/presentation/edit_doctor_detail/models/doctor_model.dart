class Doctor {
  String id;
  String name;
  String nickName;
  String email;
  String password;
  String gender;
  String imageUrl;

  Doctor({required this.id, required this.name, required this.nickName, required this.email, required this.password, required this.gender,required this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nickName': nickName,
      'email': email,
      'password': password,
      'gender': gender,
      'imageUrl': imageUrl,
    };
  }

  static Doctor fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      nickName: json['nickName'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'], imageUrl: json['imageUrl'],
    );
  }
}
