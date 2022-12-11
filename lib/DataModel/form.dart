import 'dart:convert';

FormData1 formDataFromJson(String str) => FormData1.fromJson(json.decode(str));

String formDataToJson(FormData1 data) => json.encode(data.toJson());

class FormData1 {
  String userId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  FormData1({
    this.userId = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phoneNumber = '',
  });

  factory FormData1.fromJson(Map<String, dynamic> json) => FormData1(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
      };

  void printData() {
    print(userId);
    print(firstName);
    print(lastName);
    print(email);
    print(phoneNumber);
  }

  FormData1 userData = FormData1();

  final data = {
    "firstName": "Jack",
    "lastName": "Danial",
    "email": "jackdanial@gmail.com",
    "phoneNumber": "+919876543212",
  };
}
