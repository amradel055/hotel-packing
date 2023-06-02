
import 'dart:convert';


import 'package:http/http.dart' as http;

import '../const/strings.dart';
import '../models/send_fcm_request.dart';


class NotificationServices {

  final String apiKey = "AAAAlEq9lFs:APA91bGrzO5fQDFJ6a16rMvXUlJFcMTjcNbpnZNeWeLfi4U88o1bdLh5GHJJeXsWxDF_9FNjCu5S8DcSAr3DRm0aoUhk-NJdDVO8mOJJ-JXY61BdEU2zPybeGCakj2geBpYQE3Gtmkga";

  Future sendNotification(SendFcmRequest request) async{
    Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send") ;
    var body = jsonEncode(request.toJson());

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Charset": "utf-8",
      "Authorization": "key=$apiKey"

    };

    try {
      var response = await http.post(uri , body: body , headers: headers );
      if(response.statusCode == 200){
        var _response = json.decode(utf8.decode(response.bodyBytes)) ;
        return _response ;
      }
    }catch (e){
      print(e);
    }
  }



}