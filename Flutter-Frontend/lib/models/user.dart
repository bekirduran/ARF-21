
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.lastname,
    required this.tc,
    required this.image,
    required this.adres,
    required this.accessToken,
    required this.tokenType,
  });

  final int id;
  final String username;
  final String email;
  final dynamic name;
  final dynamic lastname;
  final dynamic tc;
  final dynamic image;
  final dynamic adres;
  final String accessToken;
  final String tokenType;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    name: json["name"],
    lastname: json["lastname"],
    tc: json["tc"],
    image: json["image"],
    adres: json["adres"],
    accessToken: json["accessToken"],
    tokenType: json["tokenType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "name": name,
    "lastname": lastname,
    "tc": tc,
    "image": image,
    "adres": adres,
    "accessToken": accessToken,
    "tokenType": tokenType,
  };


}
