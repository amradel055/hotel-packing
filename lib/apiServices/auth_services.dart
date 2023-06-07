import 'dart:convert';

import 'package:http/http.dart' as http;

import '../const/strings.dart';

class AuthServices {
  Future signUp(name, address, email, phone) async {
    Uri uri = Uri.parse(url + "auth/register");
    var body = jsonEncode(
        {"name": name, "address": address, "email": email, "phone": phone});

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Charset": "utf-8",
    };

    try {
      var response = await http.post(uri, body: body, headers: headers);
      if (response.statusCode == 200) {
        var _response = json.decode(utf8.decode(response.bodyBytes));
        if (_response["success"] == true && _response["data"] != null) {
          return _response["data"];
        } else {
          return _response;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future signIn(userCode, pass) async {
    Uri uri = Uri.parse("${url}auth/loginChef");
    var body = jsonEncode({"userName": userCode, "password": pass});

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Charset": "utf-8",
    };

    try {
      var response = await http.post(uri, body: body, headers: headers);
      if (response.statusCode == 200) {
        var _response = json.decode(utf8.decode(response.bodyBytes));
        if (_response["success"] == true && _response["data"] != null) {
          return _response["data"];
        } else {
          return _response;
        }
      }
    } catch (e) {
      return null;
    }
  }
}
