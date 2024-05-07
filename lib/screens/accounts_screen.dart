import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                'Mis cuentas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16), // Add spacing
            ],
          ),
        ),
      ),
      const SizedBox(height: 16), // Add spacing
    ]);
  }
}
