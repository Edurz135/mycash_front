import 'package:flutter/material.dart';

class DetailedAccountItem extends StatelessWidget {
  final String title;
  final String amount;

  const DetailedAccountItem({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.grey.shade300,
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.grey.shade300,
              iconSize: 30,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
