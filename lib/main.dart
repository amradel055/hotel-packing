import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hotel_packaging/providers/auth_provider.dart';
import 'package:hotel_packaging/providers/homescreen_provider.dart';
import 'package:hotel_packaging/screens/Login.dart';
import 'package:hotel_packaging/screens/home_screen.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBrBEab0jI1gdFQfH_pHyQO6PwWjkyl32A',
          appId: "1:636909098075:android:26a05c9f82ab2f369d5b7e",
          messagingSenderId: "636909098075",
          projectId: "easyhotel-76224"));
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .createNotificationChannel(channel);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomescreenScreenProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
  ], child: const MyApp()));
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
      home: const login(),
    );
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications',
  // description
  importance: Importance.max,
  playSound: true,
  showBadge: true,
);
