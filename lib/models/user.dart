// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    List<UserElement> user;

    User({
        required this.user,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        user: List<UserElement>.from(json["user"].map((x) => UserElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
    };
}

class UserElement {
    String id;
    String email;
    String name;

    UserElement({
        required this.id,
        required this.email,
        required this.name,
    });

    factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        email: json["email"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
    };
}
