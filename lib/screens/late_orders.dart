import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:hotel_packaging/const/text_styles.dart';

import 'package:hotel_packaging/models/orders_model.dart';
import 'package:hotel_packaging/models/user_model.dart';
import 'package:hotel_packaging/providers/auth_provider.dart';
import 'package:hotel_packaging/providers/homescreen_provider.dart';
import 'package:hotel_packaging/widgets/order_container.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';




class LateOrdersForPacking extends StatefulWidget {
  Size size ;
  bool showDetails;

  LateOrdersForPacking(this.size , this.showDetails , {Key? key}) : super(key: key);

  @override
  _LateOrdersForPackingState createState() => _LateOrdersForPackingState();
}

class _LateOrdersForPackingState extends State<LateOrdersForPacking> {
  List<OrdersModel> lateOrdersPacking =[];
  bool loading = true ;
  Color item = Colors.grey;
  UserModel? user ;
  @override
  void initState() {
    user =  context.read<AuthProvider>().user ;
    context.read<HomescreenScreenProvider>().findLateOrdersPacking().then((value){
      lateOrdersPacking = context.read<HomescreenScreenProvider>().lateOrderspacking ;
      loading = context.read<HomescreenScreenProvider>().latepackingLoading ;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    lateOrdersPacking = context.watch<HomescreenScreenProvider>().lateOrderspacking ;
    loading = context.watch<HomescreenScreenProvider>().latepackingLoading ;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for(int i = 0 ; i < lateOrdersPacking.length ; i++)
             Container(
        height: size.height*.9,
        child: ListView.builder(  itemCount:lateOrdersPacking.length,
          itemBuilder:(context,index){

            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: widget.size.width *0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.size.width *0.02),
                  color: item,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: widget.size.width *0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("رقم الفاتوره :" , style: titleTextStyle(widget.size),) ,
                            Text(lateOrdersPacking[index].serial!.toString(), style: subTitleTextStyle(widget.size),)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widget.size.width ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("وقت الدخول :" , style: titleTextStyle(widget.size),) ,
                            Text(DateFormat("dd-MM-yyy").format(lateOrdersPacking[index].date!), style: subTitleTextStyle(widget.size),)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widget.size.width ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("وقت التسليم :" , style: titleTextStyle(widget.size),) ,
                            Text(DateFormat("dd-MM-yyy").format(lateOrdersPacking[index].endDateDelivery!), style: subTitleTextStyle(widget.size),)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widget.size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("وقت التجهيز :" , style: titleTextStyle(widget.size),) ,
                            Text(lateOrdersPacking[index].waitingTimePacking!.toString(), style: subTitleTextStyle(widget.size),)
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: widget.size.width,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       TextButton(onPressed: () {
                      //         onEnd();
                      //       }, child: Text("stop")),
                      //
                      //       // CountdownTimer(
                      //       //   endTime: lateOrdersPacking[index].endDateDelivery!.difference(OrdersGroups[index].date!).inSeconds+OrdersGroups[index].waitingTimePacking!,
                      //       //   onEnd: onEnd,
                      //       // ),
                      //       // Text("الحالة :" , style: titleTextStyle(widget.size),) ,
                      //       // Text("OrdersGroups[index].status!.toString()", style: subTitleTextStyle(widget.size),)
                      //     ],
                      //   ),
                      // ),
                      widget.showDetails ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: widget.size.width *0.8,
                          color: Colors.white70,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SizedBox(
                                  width: widget.size.width *0.6,
                                  child: Row(
                                    children: [
                                      Text(" الصنف : " , style: titleTextStyle(widget.size),),
                                      for(int i =0 ;i<lateOrdersPacking[index].detailDataAPiDtoList!.length;i++ )
                                        Text(lateOrdersPacking[index].detailDataAPiDtoList![i].itemName! , style: subTitleTextStyle(widget.size),),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SizedBox(
                                  width: widget.size.width *0.6,

                                  child: Row(
                                    children: [
                                      Text(" الكمية : " , style: titleTextStyle(widget.size),),
                                      for(int i =0 ;i<lateOrdersPacking[index].detailDataAPiDtoList!.length;i++ )
                                        Text(lateOrdersPacking[index].detailDataAPiDtoList![i].quantity!.toString() , style: subTitleTextStyle(widget.size),),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SizedBox(
                                  width: widget.size.width *0.6,

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(" الاضافات : " , style: titleTextStyle(widget.size),),
                                      for(int i =0 ;i<lateOrdersPacking[index].detailDataAPiDtoList!.length;i++ )
                                        for(int h =0 ;h<lateOrdersPacking[index].detailDataAPiDtoList![i].addtionsDtoList!.length;h++ )

                                          Text( lateOrdersPacking[index].detailDataAPiDtoList![i].addtionsDtoList == []?"لا اضافات" :lateOrdersPacking[index].detailDataAPiDtoList![i].addtionsDtoList![h].name! , style: subTitleTextStyle(widget.size),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) : const SizedBox(),
                      Padding (
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: widget.size.width *0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: (){
                                    setState(() {
                                      widget.showDetails = !widget.showDetails ;
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(widget.showDetails ? Colors.red : Colors.blue)
                                  ),
                                  child: Text(widget.showDetails ?"اخفاء"   :"اظهار" , style: titleTextStyle(widget.size),)),
                              TextButton(
                                  onPressed: (){
                                    context.read<HomescreenScreenProvider>().save(lateOrdersPacking[index].id , user?.id ?? -1,context);
                                    context.read<HomescreenScreenProvider>().getordersScreenGroups(user?.branchId ?? -1);
                                    lateOrdersPacking = context.read<HomescreenScreenProvider>().Orderslist ;

                                    setState(() {

                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.blue)
                                  ),
                                  child: Text("تسليم" , style: titleTextStyle(widget.size),)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

          },scrollDirection:Axis.vertical,),
      )

      ],
        ),
      ),
    );
  }
}