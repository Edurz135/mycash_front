import 'package:flutter/material.dart';

import 'package:mycash_front/screens/objetives/b_create_objetive_screen.dart';

class ObjetiveScreen extends StatefulWidget {
  const ObjetiveScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ObjetiveScreenState createState() => _ObjetiveScreenState();
}

class _ObjetiveScreenState extends State<ObjetiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        ClipRRect(
          borderRadius:
              BorderRadius.circular(10),
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
                  'Objetivos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16), // Add spacing
              ]
            )
          ),
        ),
        const SizedBox(height: 16), // Add spacing

        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateObjetiveScreen()
                  ),
                );
            },
            child: Ink(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                gradient: LinearGradient(colors: [Color(0xFF9C42C6), Color(0xFFE38466)],),
              ),
              child:Container(
                constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: const Text(
                  'Siguiente',
                textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ]
    );
  }
}