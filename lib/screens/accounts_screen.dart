import 'package:flutter/material.dart';
import 'package:mycash_front/components/detailed_account_item.dart';
import 'package:mycash_front/screens/create_account_screen.dart';

class AccountsScreen extends StatelessWidget {
  // final List<Map<String, dynamic>> accounts;
  final ValueNotifier<List<Map<String, dynamic>>> accounts;
  final List<Map<String, dynamic>> currencyTypes;
  final Function() fetchAccounts;
  final Function(int id) deleteAccount;
  final Function(String name, int currencyTypeId, double balance) createAccount;

  const AccountsScreen(
      {Key? key,
      required this.accounts,
      required this.currencyTypes,
      required this.fetchAccounts,
      required this.deleteAccount,
      required this.createAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Cuentas'),
        flexibleSpace: Container(
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ValueListenableBuilder<List<Map<String, dynamic>>>(
              valueListenable: accounts,
              builder: (context, accounts, child) {
                return Column(
                  children: [
                    for (var account in accounts)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: DetailedAccountItem(
                          title: account['name'] ?? '',
                          amount: '${account['CurrencyType']['short_name']} ${account['balance'] ?? 0.00}',
                          onEditPressed: () {
                            print('Edit button pressed');
                          },
                          onDeletePressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Confirmar Eliminación'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '¿Estás seguro de que quieres eliminar la cuenta "${account['name']}"?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                        'Monto: PEN ${account['balance'] ?? 0.00}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      deleteAccount(account['id']);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Eliminar'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CreateAccountScreen(currencyTypes: currencyTypes, createAccount: createAccount)),
          );
        },
        child: Icon(Icons.add, color: Colors.grey.shade300),
      ),
    );
  }
}
