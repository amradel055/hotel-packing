import 'package:flutter/material.dart';

import 'package:hotel_packaging/models/orders_model.dart';
import 'package:hotel_packaging/providers/homescreen_provider.dart';
import 'package:hotel_packaging/widgets/order_container.dart';
import 'package:provider/src/provider.dart';



class allpacking extends StatefulWidget {
  const allpacking({Key? key}) : super(key: key);

  @override
  _allpackingState createState() => _allpackingState();
}

class _allpackingState extends State<allpacking> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return
      SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child:                   Padding(
            padding: const EdgeInsets.all(4.0),
            child: OrderContainer(size,false )
        )

      ),
    );
  }
}