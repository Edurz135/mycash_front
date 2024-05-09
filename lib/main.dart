import 'package:flutter/material.dart';
import 'package:mycash_front/screens/home_screen.dart';

void main() {
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
      // theme: ThemeData.dark(),
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
    const Text(
      'Index 1: Estadísticas',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Transacciones',
      style: optionStyle,
    ),
    const Text(
      'Index 3: Perfil',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // title: const Text('BottomNavigationBar Sample'),
      //     ),
      body: Center(
          child: Padding(
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
      )),
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
            icon: Icon(Icons.format_list_bulleted),
            label: 'Transactions',
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
