import 'package:cuk/calendar/homepage.dart';
import 'package:cuk/directory/searchdirec.dart';
import 'package:cuk/search/search.dart';
import 'package:cuk/user_list/user_list.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


import '../user_profile/user_profile.dart';



class ProvidedStylesExample extends StatefulWidget {


  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  PersistentTabController _controller=PersistentTabController();
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
    const MyHomePage(),user_list(),const CRUDEoperation(),const FirebaseSearchScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [

    PersistentBottomNavBarItem(
      icon: const Icon(Icons.calendar_month),

      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
      title: "Calendar",

    ),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: "Home",

        activeColorPrimary: Colors.purple,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.phone),
      title: "Directory",

      activeColorPrimary: Colors.black87,
      inactiveColorPrimary: Colors.grey,

    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: "Search",

      activeColorPrimary: Colors.black87,
      inactiveColorPrimary: Colors.grey,

    ),

  ];

  @override
  Widget build(final BuildContext context) => Scaffold(

    body: PersistentTabView(

      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
      bottomScreenMargin: 0,


      // backgroundColor: Colors.black,
      hideNavigationBar: _hideNavBar,
      decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.bounceIn,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle: NavBarStyle
          .style9, // Choose the nav bar style with this property
    ),
  );
}