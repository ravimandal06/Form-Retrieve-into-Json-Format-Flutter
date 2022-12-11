// To parse this JSON data, do
//
//     final DbModel = DbModelFromJson(jsonString);

import 'dart:convert';

DbModel DbModelFromJson(String str) => DbModel.fromJson(json.decode(str));

String DbModelToJson(DbModel data) => json.encode(data.toJson());

class DbModel {
  DbModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,

  });

  String firstName;
  String lastName;
  String email;
  String password;


  factory DbModel.fromJson(Map<String, dynamic> json) => DbModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],

      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      };
}
