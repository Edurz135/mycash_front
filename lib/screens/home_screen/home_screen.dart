import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/components/account_item.dart';
import 'package:mycash_front/components/operation_item.dart';
import 'package:mycash_front/components/transaction_item.dart';
import 'package:mycash_front/screens/accounts_screen/accounts_screen.dart';
import 'package:mycash_front/screens/home_screen/home_screen_controller.dart';
import 'package:mycash_front/screens/transaction_detail_screen.dart';
import 'package:mycash_front/screens/income_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = Get.put(HomeScreenController());

  @override
  void initState() {
    super.initState();
    controller.fetchAccounts();
    controller.fetchCurrencyTypes();
    // _fetchAccounts();
    // _fetchCurrencyTypes();
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
              SizedBox(height: 30), // Add spacing
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
              SizedBox(height: 30), // Add spacing
            ],
          ),
        ),
        //),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      // Navigate to the settings screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountsScreen(
                                  key: null,
                                  controller: controller,
                                )),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.accounts.map((account) {
                      return AccountItem(
                        title: account.name,
                        amount:
                            '${account.currencyType.shortName} ${account.balance.toStringAsFixed(2)}',
                      );
                    }).toList(),
                  ),
                );
              }),

              const SizedBox(height: 16),
              const Text(
                'Operaciones',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IncomeScreen()),
                      );
                    },
                    child: OperationItem(
                      icon: Icons.arrow_upward,
                      label: 'Ingreso',
                    ),
                  )),
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransactionDetailsScreen()),
                    );
                  },
                  child: TransactionItem(
                      Transaccion: "Rental Income",
                      TipoTransaccion: "Débito",
                      monto: 6500,
                      fecha: '14 de diciembre 2023'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransactionDetailsScreen()),
                    );
                  },
                  child: TransactionItem(
                      Transaccion: "Universidad",
                      TipoTransaccion: "Crédito",
                      monto: 9000,
                      fecha: '18 de diciembre 2024'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransactionDetailsScreen()),
                    );
                  },
                  child: TransactionItem(
                      Transaccion: "Rental Income",
                      TipoTransaccion: "Débito",
                      monto: 6500,
                      fecha: '14 de diciembre 2023'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransactionDetailsScreen()),
                    );
                  },
                  child: TransactionItem(
                      Transaccion: "Universidad",
                      TipoTransaccion: "Crédito",
                      monto: 9000,
                      fecha: '18 de diciembre 2024'),
                ),
              ),
            ]))
      ],
    ));
  }
}
