import 'package:flutter/material.dart';
import 'package:hotel_packaging/providers/auth_provider.dart';
import 'package:hotel_packaging/providers/homescreen_provider.dart';
import 'package:hotel_packaging/screens/Login.dart';
import 'package:hotel_packaging/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() async{

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => HomescreenScreenProvider()),
            ChangeNotifierProvider(create: (_) => AuthProvider()),


          ],
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تغليف الطلبات',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const login(),
    );
  }
}


