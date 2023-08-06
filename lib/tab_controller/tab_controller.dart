
import 'package:cuk/calendar/homepage.dart';
import 'package:cuk/search/search.dart';
import 'package:cuk/user_list/user_list.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class selector_page extends StatefulWidget
{
  @override
  State<selector_page> createState() => _selector_pageState();
}

class _selector_pageState extends State<selector_page> {
  int page=0;
  @override
  Widget build(BuildContext context) {

    List pages=[const MyHomePage(),user_list(),const FirebaseSearchScreen()];

    return Scaffold(
      bottomNavigationBar:
      GNav(
          activeColor:Colors.green,
          onTabChange: (value){

            setState((){
              page=value;
            });

          },
          mainAxisAlignment: MainAxisAlignment.center,

          gap: 8,
          curve: Curves.linear,
          tabs:[

            GButton(icon: Icons.calendar_month,
              text: "Calendar",
              iconSize: 30.0,
            ),
            GButton(icon: Icons.home_outlined,
              text: "Home",
              iconSize: 30.0,
            ),
            GButton(icon: Icons.search,
              text: "Search",
              iconSize: 30.0,
            ),
          ]
      ),
      body:pages[page] ,
    );
  }
}