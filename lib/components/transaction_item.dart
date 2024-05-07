import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
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
