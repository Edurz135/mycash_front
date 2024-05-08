import 'package:flutter/material.dart';
import 'package:mycash_front/components/detailed_account_item.dart';

class AccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis cuentas'),
        flexibleSpace: Container(
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Add horizontal padding
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child:
                  DetailedAccountItem(title: 'Efectivo', amount: 'PEN 930.00'),
            ),
            const Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child:
                  DetailedAccountItem(title: 'Débito', amount: 'PEN 4200.00'),
            ),
            FloatingActionButton(
              onPressed: () {
                // Handle adding an account
              },
              child: Icon(Icons.add, color: Colors.grey.shade300),
            ),
          ],
        ),
      ),
    );
  }
}
