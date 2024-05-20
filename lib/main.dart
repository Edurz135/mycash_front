import 'package:flutter/material.dart';
import 'package:mycash_front/screens/home_screen.dart';
import 'package:mycash_front/screens/profile/profile_screen.dart';
import 'package:mycash_front/screens/statistics_screen.dart';
import 'package:mycash_front/screens/transaction_screen.dart';
import 'package:mycash_front/services/api_config.dart';

void main() {
  APIConfig.setEnvironment(
      Environment.development); // or Environment.production
  runApp(const MainLayout());
}

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    StatisticsScreen(),
    TransactionScreen(),
    const Text(
      'Index 3: Metas',
      style: optionStyle,
    ),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          16.0, // Left padding
          64.0, // Top padding
          16.0, // Right padding
          0.0, // Bottom padding
        ), // Add horizontal padding
        child: SingleChildScrollView(
            child: Container(
                alignment: Alignment.topLeft,
                child: _widgetOptions.elementAt(_selectedIndex))),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
        iconSize: 30,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(89, 134, 223, 1),
        unselectedItemColor: const Color.fromARGB(255, 175, 172, 183),
        onTap: _onItemTapped,
        showSelectedLabels: false, // Set to false to hide selected item labels
        showUnselectedLabels:
            false, // Set to false to hide unselected item labels
      ),
    );
  }
}
