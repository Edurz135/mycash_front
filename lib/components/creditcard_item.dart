import 'package:flutter/material.dart';

class CreditCardItem extends StatelessWidget {
  const CreditCardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(89, 134, 223, 1),
            Color.fromRGBO(177, 86, 168, 1)
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nueva Cuenta',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(width: 8),
              Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: Icon(Icons.wifi, size: 36, color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '1234 5678 9012 3456',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 65,
                    height: 50,
                  ),
                  Positioned(
                      left: 0,
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(232, 64, 64, 0.75),
                          ))),
                  Positioned(
                      right: 0,
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(227, 181, 60, 0.75),
                          ))),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
