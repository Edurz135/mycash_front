import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profilepic.png'),
                ),
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
                  'hawaiana 🍔🦎',
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color(0xFF1C1E24),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre: Hawaiana',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 16), // Add spacing
              Text(
                'Ayuda y soporte',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 16), // Add spacing
              Text(
                'Configuración',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 16), // Add spacing
              Text(
                'Cerrar sesión',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}