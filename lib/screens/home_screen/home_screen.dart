import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/components/account_item.dart';
import 'package:mycash_front/components/operation_item.dart';
import 'package:mycash_front/components/transaction_item.dart';
import 'package:mycash_front/screens/accounts_screen/accounts_screen.dart';
import 'package:mycash_front/screens/home_screen/home_screen_controller.dart';
import 'package:mycash_front/screens/transaction_detail_screen/transaction_detail_screen.dart';
import 'package:mycash_front/screens/transferir_screen.dart';
import 'package:mycash_front/screens/create_expenses/create_expenses_screen.dart';
import 'package:mycash_front/screens/create_income/create_income_screen.dart';
import 'package:intl/intl.dart';

import 'package:mycash_front/screens/profile/profile_screen_controller.dart';
import 'package:mycash_front/services/user_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = Get.put(HomeScreenController());
  ProfileScreenController profileController = Get.put(ProfileScreenController());

  checkInfo() async {
    await profileController.fetchAccounts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkInfo();
    controller.fetchAccounts();
    controller.fetchCurrencyTypes();
    controller.fetchTransactions(); // Fetch transactions
    controller.fetchCategories(); // Fetch categories
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          child: Column(
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
              SizedBox(height: 16),
              Obx(() => Text(
                controller.accounts.isNotEmpty ? '${profileController.currentAcc}' : '${profileController.currentAcc}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              )),
              SizedBox(height: 30), // Add spacing
            ],
          ),
        ),
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
                        MaterialPageRoute(builder: (context) => CreateIncomeScreen(controller: controller,)),
                      );
                    },
                    child: OperationItem(
                      icon: Icons.arrow_upward,
                      label: 'Ingreso',
                    ),
                  )),
                  SizedBox(width: 8), // Add spacing between boxes
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateExpenseScreen(controller: controller,)),
                      );
                    },
                    child: OperationItem(
                      icon: Icons.arrow_downward,
                      label: 'Gasto',
                    ),
                  )),
                    SizedBox(width: 8), // Add spacing between boxes
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TransferirScreen()),
                          );
                        },
                        child: OperationItem(
                          icon: Icons.transfer_within_a_station,
                          label: 'Transferir',
                          ),
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
              const SizedBox(height: 16),
              Obx(() {
                return Column(
                  children: controller.transaccions.map((transaction) {
                    final category = controller.getCategoryNameById(transaction.categoryId);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: GestureDetector(
                        onTap: () async {
                          final res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionDetailsScreen(transaction: transaction, category: category)),
                          );
                        },
                        child: TransactionItem(
                          Transaccion: transaction.type,
                          TipoTransaccion: category,
                          monto: transaction.amount,
                          fecha: DateFormat('dd/MM/yyyy HH:mm:ss').format(transaction.createdAt)
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ]))
      ],
    ));
  }
}
