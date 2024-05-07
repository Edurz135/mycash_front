import 'package:flutter/material.dart';
import 'package:mycash_front/components/account_item.dart';
import 'package:mycash_front/components/operation_item.dart';
import 'package:mycash_front/components/transaction_item.dart';

class HomeScreen extends StatelessWidget {
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
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              AccountItem(title: 'Efectivo', amount: 'PEN 930.00'),
              AccountItem(title: 'Débito', amount: 'PEN 4200.00'),
              AccountItem(title: 'Añadir', amount: 'Cuenta'),
              // Add more here if needed
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
        const Row(
          children: [
            Expanded(
              child: OperationItem(
                icon: Icons.arrow_upward,
                label: 'Ingreso',
              ),
            ),
            SizedBox(width: 8), // Add spacing between boxes
            Expanded(
              child: OperationItem(
                icon: Icons.arrow_downward,
                label: 'Gasto',
              ),
            ),
            SizedBox(width: 8), // Add spacing between boxes
            Expanded(
              child: OperationItem(
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
          child: TransactionItem(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TransactionItem(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TransactionItem(),
        ),
      ],
    );
  }
}
