class UserModel {
  final String name;
  final String email;
  final String idGoogle;

  UserModel({required this.name, required this.email, required this.idGoogle});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      idGoogle: json["idGoogle"],
    );
  }
}
