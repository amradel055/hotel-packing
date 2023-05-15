


import 'package:flutter/material.dart';

class Helper {

  // final databaseReference = FirebaseDatabase.instance.ref();

  showSnackBar(BuildContext context , text){
    return  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor:Colors.green,
      duration: const Duration(seconds: 1),
      content:  Text(text ,
        textAlign: TextAlign.center,

      ),
    ));
  }

  // Future updateFirebaseOrders(orders , orderId) async {
  //   await databaseReference.child("orders/$orders").push().update({"orderId" : orderId});
  // }
  //
  // Future updateFireStoreOrders(branchId , orderId) async {
  //  final doc = FirebaseFirestore.instance.collection("orders").doc("$branchId");
  //  final order= {
  //    "$orderId" : orderId
  //  };
  //  doc.set(order);
  // }

  String formatDateToDate(DateTime date){
    return date.toString().split(" ")[0] ;
  }

  String formatDateToTime(DateTime date){
    return date.toString().split(" ")[1].split(".")[0] ;
  }
}