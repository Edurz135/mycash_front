import 'package:flutter/material.dart';

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
      home: BottomNavBar(),
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
    HomePageContent(),
    const Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
    const Text(
      'Index 2: asdf',
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
      appBar: AppBar(
          // title: const Text('BottomNavigationBar Sample'),
          ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Add horizontal padding
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(10), // Set border radius for rounding
                child: Container(
                  width: double.infinity, // Full width of the screen
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(89, 134, 223, 1),
                        Color.fromRGBO(177, 86, 168, 1)
                      ],
                    ),
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 16), // Add spacing
                      Text(
                        'Bienvenido',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Pato 🦆',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16), // Add spacing
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16), // Add spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lista de cuentas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MiniBox(title: 'Efectivo', amount: 'PEN 930.00'),
                    MiniBox(title: 'Débito', amount: 'PEN 4200.00'),
                    MiniBox(title: 'Añadir', amount: 'Cuenta'),
                    // Add more MiniBoxes here if needed
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Operaciones',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: MiniRoundedBox(
                      icon: Icons.arrow_upward,
                      label: 'Ingreso',
                    ),
                  ),
                  SizedBox(width: 8), // Add spacing between boxes
                  Expanded(
                    child: MiniRoundedBox(
                      icon: Icons.arrow_downward,
                      label: 'Gasto',
                    ),
                  ),
                  SizedBox(width: 8), // Add spacing between boxes
                  Expanded(
                    child: MiniRoundedBox(
                      icon: Icons.transfer_within_a_station,
                      label: 'Transferir',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Últimas transacciones',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // Add more content for operations here if needed
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomItem(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomItem(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniBox extends StatelessWidget {
  final String title;
  final String amount;

  const MiniBox({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(89, 134, 223, 1),
              Color.fromRGBO(177, 86, 168, 1)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiniRoundedBox extends StatelessWidget {
  final IconData icon;
  final String label;

  const MiniRoundedBox({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 175, 172, 183),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: const Color(0xFF121212),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class CustomItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Set border radius for rounding
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Section
            ClipRRect(
              // Wrap the container with ClipRRect
              borderRadius: BorderRadius.circular(
                  10), // Set border radius for the rounded square
              child: Container(
                height: 45,
                width: 45,
                color: const Color.fromARGB(255, 175, 172, 183),
                child:
                    const Icon(Icons.home, color: Color(0xFF121212), size: 32),
              ),
            ),
            const SizedBox(width: 16), // Add spacing between sections
            // Second Section
            const Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rental Income',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Débito',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16), // Add spacing between sections
            // Third Section
            const Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'PEN 6,500.00',
                    style: TextStyle(
                        color: Color.fromRGBO(80, 196, 116, 1), fontSize: 19),
                  ),
                  Text(
                    '14 diciembre 2023',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
