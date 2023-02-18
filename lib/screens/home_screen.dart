import 'package:flutter/material.dart';
import 'package:hotel_packaging/const/text_styles.dart';
import 'package:hotel_packaging/models/orders_model.dart';
import 'package:hotel_packaging/providers/homescreen_provider.dart';
import 'package:hotel_packaging/screens/allpacking.dart';
import 'package:hotel_packaging/widgets/order_container.dart';
import 'package:provider/src/provider.dart';

import 'late_orders.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen( {Key? key , required  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index=1;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    late TimeOfDay selectedTime=TimeOfDay.fromDateTime(DateTime.now().add(Duration(minutes: 10))) ;
    int difference = selectedTime.periodOffset-selectedTime.periodOffset;
    int difference2 = selectedTime.minute-selectedTime.minute;
    var searchController = TextEditingController();
    List<OrdersModel> OrdersGroups = [] ;
    List pages =  [LateOrdersForPacking(size,false)  ,allpacking() ] ;






    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('الطلبات',style: subTitleTextStyle(size),)),

        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child:
        SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child:  Container(height: size.height,
                child:Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: size.width*.9,
                        child: TextField(
                          controller: searchController,
                          onChanged: (value){
                            context.read<HomescreenScreenProvider>().filter(searchController.text, 0);
                            OrdersGroups = context.read<HomescreenScreenProvider>().Orderslist ;

                          },
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
                      ),
                    ),
                  Container(
                    height: size.height * 0.1,
                    width: size.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildTapButton(size , "النشطه" , 1),
                          _buildTapButton(size , "المتآخرةعن التغليف" , 0),



                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width,
                      height: size.height * 0.55 ,
                      child : pages[_index] )





                ],)
            )


          ),
        ),
      ),

    );
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
    var items = [];
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }
  _buildTapButton(Size size, title, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _index = index ;
        });
      },
      child: Container(
        height: size.height * 0.1,
        width: size.width * 0.5,

        decoration: BoxDecoration(
            color:  Colors.white ,
            border: Border(bottom: _index == index ? const BorderSide(color: Colors.black , width: 3) : BorderSide.none)
        ),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: size.width * 0.047,
                    fontWeight:_index == index ? FontWeight.w900 : FontWeight.w500,
                    color: Colors.black
                ),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}