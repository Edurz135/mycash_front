import 'package:flutter/material.dart';

import 'package:mycash_front/screens/home_screen/home_screen.dart';
import 'package:mycash_front/screens/profile/profile_screen.dart';
import 'package:mycash_front/screens/statistics_screen.dart';
import 'package:mycash_front/screens/transaction_screen/transaction_screen.dart';
import 'package:mycash_front/screens/objective_screens/a_objective_screen.dart';


class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = <Widget>[
    HomeScreen(),
    StatisticsScreen(),
    TransactionScreen(),
    ObjectiveScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromRGBO(89, 134, 223, 1),
        unselectedItemColor: const Color.fromARGB(255, 175, 172, 183),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 30), 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.center_focus_strong),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
