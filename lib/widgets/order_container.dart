import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:hotel_packaging/const/text_styles.dart';
import 'package:hotel_packaging/models/orders_model.dart';
import 'package:hotel_packaging/providers/homescreen_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';


class OrderContainer extends StatefulWidget {
    Size size ;
    bool showDetails;
    OrderContainer(this.size , this.showDetails , {Key? key}) : super(key: key);


  @override
  _OrderContainerState createState() => _OrderContainerState();
}

class _OrderContainerState extends State<OrderContainer> {
  List<OrdersModel> OrdersGroups = [] ;
  bool Loading = true ;
   CountdownTimerController? controller;



  @override
  void initState() {
    context.read<HomescreenScreenProvider>().getordersScreenGroups(232).then((value){
      OrdersGroups = context.read<HomescreenScreenProvider>().Orderslist ;
      Loading = context.read<HomescreenScreenProvider>().loading ;
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    OrdersGroups = context.watch<HomescreenScreenProvider>().Orderslist ;
    Loading = context.watch<HomescreenScreenProvider>().loading ;
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10;
    Color item = Colors.grey;



    void onEnd() {
      print('onEnd');
      // setState(() {
      //   item =Colors.red;
      // });

    }


    return
      Container(
      height: size.height*.9,
      child: RefreshIndicator(
        onRefresh:  () => context.read<HomescreenScreenProvider>().getordersScreenGroups(232) ,
        child: ListView.builder(
          itemCount:OrdersGroups.length,
          dragStartBehavior: DragStartBehavior.start,

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
                            Text(OrdersGroups[index].serial==null?"":(OrdersGroups[index].serial!.toString()), style: subTitleTextStyle(widget.size),)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widget.size.width ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("وقت الدخول :" , style: titleTextStyle(widget.size),) ,
                            Text(OrdersGroups[index].date!= null ? DateFormat("dd-MM-yyy").format(OrdersGroups[index].date!) : "", style: subTitleTextStyle(widget.size),)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widget.size.width ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("وقت التسليم :" , style: titleTextStyle(widget.size),) ,
                            Text(OrdersGroups[index].endDateDelivery==null?"":DateFormat("dd-MM-yyy").format(OrdersGroups[index].endDateDelivery!), style: subTitleTextStyle(widget.size),)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widget.size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("وقت التجهيز :" , style: titleTextStyle(widget.size),) ,
                            Text(OrdersGroups[index].waitingTimePacking==null?"":OrdersGroups[index].waitingTimePacking!.toString(), style: subTitleTextStyle(widget.size),)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widget.size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(onPressed: () {
                              onEnd();
                            }, child: Text("stop")),

                  CountdownTimer(
                  endTime: OrdersGroups[index].endDateDelivery?.difference(OrdersGroups[index].date!).inSeconds ?? 0+(OrdersGroups[index].waitingTimePacking ?? 0),
                  onEnd: onEnd,
                ),
                            // Text("الحالة :" , style: titleTextStyle(widget.size),) ,
                            // Text("OrdersGroups[index].status!.toString()", style: subTitleTextStyle(widget.size),)
                          ],
                        ),
                      ),
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
                                      for(int i =0 ;i<(OrdersGroups[index].detailDataAPiDtoList?.length ?? 0);i++ )
                                        Text(OrdersGroups[index].detailDataAPiDtoList![i].itemName! , style: subTitleTextStyle(widget.size),),
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
                                      for(int i =0 ;i<OrdersGroups[index].detailDataAPiDtoList!.length;i++ )
                                      Text(OrdersGroups[index].detailDataAPiDtoList![i].quantity!.toString() , style: subTitleTextStyle(widget.size),),
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
                                      for(int i =0 ;i<OrdersGroups[index].detailDataAPiDtoList!.length;i++ )
                                        for(int h =0 ;h<OrdersGroups[index].detailDataAPiDtoList![i].addtionsDtoList!.length;h++ )

                                          Text( OrdersGroups[index].detailDataAPiDtoList![i].addtionsDtoList == []?"لا اضافات" :OrdersGroups[index].detailDataAPiDtoList![i].addtionsDtoList![h].name! , style: subTitleTextStyle(widget.size),),
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
                                    context.read<HomescreenScreenProvider>().save(OrdersGroups[index].id,1,context);
                                    context.read<HomescreenScreenProvider>().getordersScreenGroups(232);
                                    OrdersGroups = context.read<HomescreenScreenProvider>().Orderslist ;

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
      ),
    );


  }

}
