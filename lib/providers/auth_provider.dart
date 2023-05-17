


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apiServices/auth_services.dart';
import '../const/enums.dart';
import '../const/helper_methods.dart';
import '../const/strings.dart';
import '../models/user_model.dart';
import '../screens/home_screen.dart';

class AuthProvider with ChangeNotifier {

  UserModel? user ;
  bool loading = false ;
  Future signIn(userCode, pass , context) async{
    loading = true ;
    notifyListeners();
      await AuthServices().signIn(userCode, pass).then((value){
        if(value != null ){
          if(value['success']){
            //logged in
            user = UserModel.fromJson(value);
            saveUserData(user!);
            loading = false ;
            notifyListeners();

            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const  HomeScreen() ));
            Helper().showSnackBar(context,"Logged in Successfully" );
          }else {
            Helper().showSnackBar(context, "error" );
            loading = false ;
            notifyListeners();
          }
        }
      });
    loading = false ;
    notifyListeners();
  }

  Future logout()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(loginDataKey);
  }


  Future saveUserData(UserModel customer) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(loginDataKey, jsonEncode(customer.toJson()));
  }

  Future getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString(loginDataKey) != null){
    user = UserModel.fromJson(jsonDecode(prefs.getString(loginDataKey)!));
    notifyListeners();
    }
  }


}