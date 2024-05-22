import 'package:flutter/material.dart';
import 'package:mycash_front/components/transaction_item.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String _filtroActual = 'Todos';

  List<Map<String, dynamic>> transacciones = [
    {
      "Transaccion": "Rental Income",
      "TipoTransaccion": "Débito",
      "monto": 6500,
      "fecha": '14 de diciembre 2023'
    },
    {
      "Transaccion": "Universidad",
      "TipoTransaccion": "Crédito",
      "monto": 9000,
      "fecha": '18 de diciembre 2024'
    },
    {
      "Transaccion": "Compra",
      "TipoTransaccion": "Débito",
      "monto": 3000,
      "fecha": '20 de diciembre 2024'
    },
    // Añade más transacciones según sea necesario
  ];

  List<Map<String, dynamic>> get transaccionesFiltradas {
    if (_filtroActual == 'Todos') {
      return transacciones;
    } else {
      return transacciones
          .where((transaccion) => transaccion['Transaccion'] == _filtroActual)
          .toList();
    }
  }

  double _calcularTotalSaldo() {
  double total = 0;
  for (var transaccion in transacciones) {
    total += transaccion['monto'];
  }
  return total;
}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Set border radius for rounding
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
                  SizedBox(height: 50), // Add spacing
                  Text(
                    'Transacciones',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50), // Add spacing
                ],
              ),
            ),
          ),
          SizedBox(height: 20), // Add spacing between the transaction box and the total balance box
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 51, 51, 51), // Use grey color for the box
              borderRadius: BorderRadius.circular(10), // Make it circular
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${_calcularTotalSaldo().toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '     Total Saldo',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Lista de cuentas',
            style: TextStyle(
                    fontSize: 16,
                  )
          ),
          SizedBox(height: 20),
          /*Tres botones de filtro*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _filtroActual = 'Todos';
                  });
                },
                child: Text('Todos',
                        style: TextStyle(color: Colors.white)
                )
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _filtroActual = 'Rental Income';
                  });
                },
                child: Text('Rental Income',
                  style: TextStyle(color: Colors.white)
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _filtroActual = 'Universidad';
                  });
                },
                child: Text('Universidad',
                  style: TextStyle(color: Colors.white)
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Transacciones',
            style: TextStyle(
                    fontSize: 16,
                  )
          ),
          SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: transaccionesFiltradas.map((transaccion) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: GestureDetector(
                    child: TransactionItem(
                      Transaccion: transaccion["Transaccion"],
                      TipoTransaccion: transaccion["TipoTransaccion"],
                      monto: transaccion["monto"],
                      fecha: transaccion["fecha"],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
