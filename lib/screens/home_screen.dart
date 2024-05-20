import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mycash_front/components/account_item.dart';
import 'package:mycash_front/components/operation_item.dart';
import 'package:mycash_front/components/transaction_item.dart';
import 'package:mycash_front/screens/accounts_screen.dart';
import 'package:mycash_front/services/account_service.dart';
import 'package:mycash_front/screens/transaction_detail_screen.dart';
import 'package:mycash_front/services/currencyType_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<List<Map<String, dynamic>>> _accounts =
      ValueNotifier<List<Map<String, dynamic>>>([]);

  List<Map<String, dynamic>> _currencyTypes = [];

  Future<void> _fetchAccounts() async {
    // title: account['name'],
    //                 amount:
    //                     '${account['CurrencyType']['short_name']} ${account['balance'].toStringAsFixed(2)}',

    try {
      setState(() {
        _accounts.value = [
          {
            "id": 1,
            "name": "Débito",
            "type": null,
            "balance": 50,
            "userId": 1,
            "accountTypeId": null,
            "currencyTypeId": 2,
            "createdAt": "2024-05-20T15:28:19.000Z",
            "updatedAt": "2024-05-20T15:28:19.000Z",
            "CurrencyType": {
              "id": 2,
              "name": "Nuevo Sol",
              "short_name": "PEN",
              "symbol": "S/.",
              "base_exchange_rate": 3.7,
              "createdAt": "2024-05-15T18:06:51.000Z",
              "updatedAt": "2024-05-20T15:27:24.000Z"
            }
          },
          {
            "id": 2,
            "name": "Yape",
            "type": null,
            "balance": 500,
            "userId": 1,
            "accountTypeId": null,
            "currencyTypeId": 1,
            "createdAt": "2024-05-20T15:28:31.000Z",
            "updatedAt": "2024-05-20T15:28:31.000Z",
            "CurrencyType": {
              "id": 1,
              "name": "Dolar",
              "short_name": "USD",
              "symbol": "\$",
              "base_exchange_rate": 1,
              "createdAt": "2024-05-15T18:06:51.000Z",
              "updatedAt": "2024-05-20T15:27:24.000Z"
            }
          },
          {
            "id": 3,
            "name": "Plin",
            "type": null,
            "balance": 2000,
            "userId": 1,
            "accountTypeId": null,
            "currencyTypeId": 1,
            "createdAt": "2024-05-20T15:28:49.000Z",
            "updatedAt": "2024-05-20T15:28:49.000Z",
            "CurrencyType": {
              "id": 1,
              "name": "Dolar",
              "short_name": "USD",
              "symbol": "\$",
              "base_exchange_rate": 1,
              "createdAt": "2024-05-15T18:06:51.000Z",
              "updatedAt": "2024-05-20T15:27:24.000Z"
            }
          }
        ];
      });
      return;
      // ignore: dead_code
      print("Fetching accounts");
      final List<Map<String, dynamic>> fetchedAccounts =
          await AccountService.fetchAccounts();
      setState(() {
        print(fetchedAccounts);
        _accounts.value = fetchedAccounts;
      });
    } catch (error) {
      print('Failed to fetch accounts: $error');
    }
  }

  Future<void> _deleteAccount(int id) async {
    // Call the service to create the account
    return;
    // ignore: dead_code
    print('Deleting account');
    AccountService.deleteAccount(id).then((_) {
      _fetchAccounts();
    }).catchError((error) {
      print("Error deleting account: $error");
    });
  }

  void _createAccount(String name, int currencyTypeId, double balance) {
    return;
    // Call the service to create the account
    // ignore: dead_code
    print('Creating account');
    AccountService.createAccount(
      name,
      balance,
      currencyTypeId,
    ).then((_) {
      _fetchAccounts();
    }).catchError((error) {
      // Handle errors if any
      print("Error creating account: $error");
      // You can show an error message to the user if needed
    });
  }

  void _fetchCurrencyTypes() async {
    try {
      setState(() {
        _currencyTypes = [
          {
            "id": 1,
            "name": "Dolar",
            "short_name": "USD",
            "symbol": "\$",
            "base_exchange_rate": 1,
            "createdAt": "2024-05-15T18:06:51.000Z",
            "updatedAt": "2024-05-20T15:27:24.000Z"
          },
          {
            "id": 2,
            "name": "Nuevo Sol",
            "short_name": "PEN",
            "symbol": "S/.",
            "base_exchange_rate": 3.7,
            "createdAt": "2024-05-15T18:06:51.000Z",
            "updatedAt": "2024-05-20T15:27:24.000Z"
          }
        ];
      });
      return;
      // ignore: dead_code
      print("Fetching currencyTypes");
      final List<Map<String, dynamic>> fetchedCurrencyTypes =
          await CurrencyTypeService.fetchCurrencyTypes();
      setState(() {
        _currencyTypes = fetchedCurrencyTypes;
      });
    } catch (error) {
      print('Failed to fetch currency types: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAccounts();
    _fetchCurrencyTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(10), // Set border radius for rounding
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
                SizedBox(height: 16), // Add spacing
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
                SizedBox(height: 16), // Add spacing
              ],
            ),
          ),
        ),
        const SizedBox(height: 16), // Add spacing
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
                            accounts: _accounts,
                            currencyTypes: _currencyTypes,
                            fetchAccounts: _fetchAccounts,
                            deleteAccount: _deleteAccount,
                            createAccount: _createAccount,
                          )),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<List<Map<String, dynamic>>>(
          valueListenable: _accounts,
          builder: (context, accounts, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: accounts.map((account) {
                  return AccountItem(
                    title: account['name'],
                    amount:
                        '${account['CurrencyType']['short_name']} ${account['balance'].toStringAsFixed(2)}',
                  );
                }).toList(),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'Operaciones',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: OperationItem(
                icon: Icons.arrow_upward,
                label: 'Ingreso',
              ),
            ),
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
      ],
    );
  }
}
