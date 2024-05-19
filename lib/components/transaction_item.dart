import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {

  final String Transaccion;
  final String TipoTransaccion;
  final double monto;
  final String fecha;

  TransactionItem({
    required this.Transaccion,
    required this.TipoTransaccion,
    required this.monto,
    required this.fecha
  });

  @override
  Widget build(BuildContext context) {
        // Formatear la fecha como una cadena legible

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
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Transaccion,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    TipoTransaccion,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16), // Add spacing between sections
            // Third Section
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'PEN $monto',
                    style: TextStyle(
                        color: Color.fromRGBO(80, 196, 116, 1), fontSize: 19),
                  ),
                  Text(
                    fecha,
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
