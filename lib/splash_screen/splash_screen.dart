import 'dart:async';

import 'package:cuk/tab_controller/tab_controller.dart';
import 'package:cuk/user_list/user_list.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget
{


  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>selector_page()));
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/cuklo.png",),


          ],
        ),


      ),
    );
  }
}