import 'dart:io';
import 'package:flutter/material.dart';
import '../../Utils/colors.dart';
import '../../Utils/preference manager.dart';
import '../home/Profile.dart';
import '../home/events.dart';
import '../home/explore.dart';
import '../home/home.dart';
import '../home/jounery.dart';

class BottomBar extends StatefulWidget {
  final int currentIndex;
  const BottomBar({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  String token = "";

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    token = PreferenceManager.getStringValue(key: "token") ?? "";
  }

  final List<Widget> pages = [
    Home(),
    Explore(),
    Journey(),
    Events(),
    Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(child: pages[currentIndex]),
        bottomNavigationBar: Container(
          height: Platform.isIOS ? height * 0.11 : 82,
          color: AppColors.white,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            currentIndex: currentIndex,
            selectedItemColor: Color(0xFF111827),
            unselectedItemColor: Color(0xFF9CA3AF),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.flight_takeoff),
                label: "Trips",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Events",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
