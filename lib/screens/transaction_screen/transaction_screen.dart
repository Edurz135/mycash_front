import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/components/transaction_item.dart';
import 'package:mycash_front/model/transaction.dart';
import 'package:mycash_front/screens/transaction_screen/transaction_screen_controller.dart';
import 'package:intl/intl.dart';
import 'package:mycash_front/screens/transaction_detail_screen/transaction_detail_screen.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int _filtroActual = 0;
  TransaccionScreenController controller = Get.put(TransaccionScreenController());

  @override
  void initState(){
    super.initState();
    controller.fetchCategories();
    controller.fetchTransactions();
  }

  List<Transaction> get transaccionesFiltradas {
    List<Transaction> transacciones;

    if (_filtroActual == 0) {
      transacciones = controller.transaccions;
    } else {
      transacciones = controller.transaccions
        .where((transaccion) => transaccion.categoryId == _filtroActual)
        .toList();
    }

    // Ordenar por fecha, de más reciente a más antiguo
    transacciones.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return transacciones;
  }

  double _calcularTotalSaldo() {
    double total = 0;
    for (var transaccion in controller.transaccions) {
      total += transaccion.amount;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //ClipRRect(
            //borderRadius:
              //BorderRadius.circular(10), // Set border radius for rounding
            //child: 
            Container(
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
                  SizedBox(height: 43), // Add spacing
                  Text(
                    'Transacciones',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 43), // Add spacing
                ],
              ),
            ),
          //),
          //SizedBox(height: 20), // Add spacing between the transaction box and the total balance box
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color:
                          Color.fromARGB(255, 51, 51, 51), // Use grey color for the box
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
                  Text('Lista de cuentas',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  SizedBox(height: 20),
                  /*Tres botones de filtro*/
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _filtroActual = 0;
                            });
                          },
                          child: Text('Todos', style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _filtroActual = 1;
                            });
                          },
                          child: Text('Entrenamiento', style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _filtroActual = 2;
                            });
                          },
                          child: Text('Transporte', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Transacciones',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: transaccionesFiltradas.map((transaccion) {
                        final category = controller.getCategoryNameById(transaccion.categoryId);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: GestureDetector(
                            onTap: () async {
                          final res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionDetailsScreen(transaction: transaccion, category: category)),
                            );
                          },
                            child: TransactionItem(
                              Transaccion: transaccion.type,
                              TipoTransaccion: category,
                              monto: transaccion.amount,
                              fecha: DateFormat('dd/MM/yyyy HH:mm:ss').format(transaccion.createdAt),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ), 
                ],
              )
          )
        ],
      ),
    );
  }
}
