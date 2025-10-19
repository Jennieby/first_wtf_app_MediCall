import 'package:first_wtf_app/pages/contact_page.dart';
import 'package:first_wtf_app/pages/home_page.dart';
import 'package:first_wtf_app/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexToBeShown = 0;
  var pages = [HomePage(), ContactPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],//IndexedStack is an alternative
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexToBeShown,
        onTap: (newIndex) {
          setState(() {
            indexToBeShown = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home),),
          BottomNavigationBarItem(label: "Contact", icon: Icon(Icons.call),),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person),),
        ],
      ),
    );
  }
}