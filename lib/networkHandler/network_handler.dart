import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:onboarding_ui/screens/SignUp.dart';

class NetworkHandler {
  static final client = http.Client();
  static Future<String> post(var body, String endpoint) async {
    print(buildUrl(endpoint));
    print(body);
    var response = await client.post(buildUrl(endpoint),
        body: body, headers: {"Content-type": "application/json"});
    print(response.statusCode);
    if (response.statusCode == 500) {
      print("Error ${response.body}");
      print(jsonDecode(response.body)["error"]);
      // registerController.errorText = jsonDecode(response.body)["error"];
    }
    if (response.statusCode == 200) {
      return response.body;
    }
    return "Error";
  }

  static Future<String> get(String endpoint) async {
    try {
      var responseGet = await client.get(buildUrl(endpoint));
      if (responseGet.statusCode == 200) {
        return responseGet.body;
      }
    } catch (e) {
      print(e);
    }
    return "Error";
  }

  static Future<String> delete(String endpoint, Object body) async {
    try {
      var responseDelete = await client.delete(buildUrl(endpoint), body: body);
      return responseDelete.body;
    } catch (e) {
      print("Error occured");
      print(e);
    }
    return "Error";
  }

// wholesomeeten.gives
  static buildUrl(String endpoint) {
    String host = "http:// 192.168.146.1:8080/";

    final apiPath = host + endpoint;
    print(apiPath);
    return Uri.parse(apiPath);
  }
}
