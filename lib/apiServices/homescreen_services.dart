

import 'dart:convert';

import 'package:hotel_packaging/const/strings.dart';
import 'package:http/http.dart' as http;

class HomescreenServices {

  Future getOrdersGroups(int branchId) async {
    Uri uri = Uri.parse(url + "distribution/distributionList") ;
    var body = jsonEncode({
      "branchId" : branchId
    });
    Map<String,String> headers = {
      "Content-Type": "application/json",
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

  Future save(int id,int packingBy) async{
    Uri uri = Uri.parse(url + "collect/updatePackingOrder");


    var body = jsonEncode({
      "id" : id ,
      "packingBy":packingBy
    });
    // print(body);
    Map<String,String> headers = {
      "Content-Type": "application/json",
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

  Future lateorderspacking(int branchId) async{

    Uri uri = Uri.parse(url + "delivery/latePackingOrder") ;
    var body = jsonEncode({
      "branchId" : branchId ,
    });

    Map<String,String> headers = {
      "Content-Type": "application/json",
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