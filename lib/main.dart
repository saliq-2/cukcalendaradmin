import 'package:cuk/api/firebase_api.dart';
import 'package:cuk/splash_screen/splash_screen.dart';
import 'package:cuk/user_list/user_list.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'firebase_options/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'cuk',
    options: DefaultFirebaseConfig.platformOptions,

  );
  await FirebaseApi().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(




        primarySwatch: Colors.blue,
      ),
      home: splash_screen(),
    );
  }
}



