import 'package:flutter/material.dart';

class TransactionDetailsScreen extends StatelessWidget {
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
              "Rental Income",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width, height: 10),
            Text(
              "14 Dic. 2023 - 04:24 PM",
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
                  "Ingreso",
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
                  "+ PEN 6,500.00",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    shadows: [
                      Shadow(
                        color: Colors.white, // Color del resplandor
                        blurRadius: 7, // Radio de desenfoque del resplandor
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
                  "24/01/2024",
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

