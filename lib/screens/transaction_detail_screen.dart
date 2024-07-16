import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mycash_front/model/transaction.dart'; // Importa tu modelo de transacción

class TransactionDetailsScreen extends StatelessWidget {
  final Transaction transaction; // Define la variable para la transacción

  TransactionDetailsScreen({required this.transaction}); // Constructor para recibir la transacción

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles de transacción", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF5986DF),
                    Color(0xFFB156A8),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
      ),
      body: Column(
        children: [
          SizedBox(width:MediaQuery.of(context).size.width, height:50),
           ClipRRect(
              borderRadius: BorderRadius.circular(
                  10), 
              child: Container(
                height: 70,
                width: 70,
                color: const Color.fromARGB(255, 175, 172, 183),
                child:
                    const Icon(Icons.home, color: Color(0xFF121212), size: 50),
              ),
            ),
            SizedBox(width:MediaQuery.of(context).size.width, height:25),
            Text(
              transaction.type,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width, height: 10),
            Text(
              DateFormat('dd MMM. yyyy - hh:mm a').format(transaction.createdAt),
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey
              ),
            ),
            SizedBox(width:MediaQuery.of(context).size.width, height:25),
            Row(
              children: [
                SizedBox(width:MediaQuery.of(context).size.width*0.15, height:25),
                Text(
                  "Tipo:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width:90, height:25),
                Text(
                  transaction.type,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                )]
            ),
            SizedBox(width:MediaQuery.of(context).size.width, height:25),
            Row(
              children: [
                SizedBox(width:MediaQuery.of(context).size.width*0.15, height:25),
                Text(
                  "Importe:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width:60, height:25),
                Text(
                  "PEN ${transaction.amount}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 7,
                      ),
                    ]
                  ),
                )]
            ),
            SizedBox(width:MediaQuery.of(context).size.width, height:25),
            Row(
              children: [
                SizedBox(width:MediaQuery.of(context).size.width*0.15, height:25),
                Text(
                  "Fecha:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width:75, height:25),
                Text(
                  DateFormat('dd/MM/yyyy').format(transaction.createdAt),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                )]
            ),
            SizedBox(width:MediaQuery.of(context).size.width, height:MediaQuery.of(context).size.height * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 150,
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
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Editar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ),
                SizedBox(width: 15),
                Container(
                    width: 150,
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
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Eliminar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                )
              ],
            )
        ],    
        mainAxisAlignment: MainAxisAlignment.start,
      )
    );
  }
}
