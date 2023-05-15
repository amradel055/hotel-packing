



import 'package:flutter/material.dart';
import 'package:hotel_packaging/apiServices/homescreen_services.dart';
import 'package:hotel_packaging/models/orders_model.dart';


class HomescreenScreenProvider with ChangeNotifier {
  bool loading = true ;
  List<OrdersModel> Orderslist = [] ;
  List<OrdersModel> lateOrderspacking = [] ;
  bool latepackingLoading = true ;



  Future getordersScreenGroups(branchId) async{
    await HomescreenServices().getOrdersGroups(branchId).then((value){
      if(value != null){
        Orderslist = List<OrdersModel>.from(value.map((e) => OrdersModel.fromJson(e)));
        loading = false ;
        notifyListeners();
      }else{
        loading = false ;
      }
    });
  }

  Future save (  int ? id,int?packingBy,BuildContext context)async{
    await HomescreenServices().save(id!,packingBy!).then((value) {
      if (value == null) {

        id=id;
        packingBy=packingBy;

        notifyListeners();

      }else{
        // error message
      }
      notifyListeners();

    }
    );
  }
  Future findLateOrdersPacking () async {
    latepackingLoading = true ;
    await HomescreenServices().lateorderspacking(232)
        .then((res){
      if(res != null){
        lateOrderspacking = List<OrdersModel>.from(res.map((e) => OrdersModel.fromJson(e)));
        // lateOrderspacking = List<OrdersModel>.from(res.map((OrdersModel) => OrdersModel.fromJson(OrdersModel)));
      }
      latepackingLoading = false ;
      notifyListeners();
    }
    ).catchError((e){
      print(e);
      latepackingLoading = false ;
      notifyListeners();
    });
  }

  filter(String orderNumber , index){
    if(index == 0){
      Orderslist = List<OrdersModel>.from(Orderslist.where((element) => element.serial.toString().contains(orderNumber)).toList());
      notifyListeners();
    }
  }

}