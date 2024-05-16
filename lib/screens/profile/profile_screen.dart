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
                Text(
                  'Holi',
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
        const Text(
          'texto',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'mas texto',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'ola',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
