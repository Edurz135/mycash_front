import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/components/detailed_account_item.dart';
import 'package:mycash_front/screens/create_account_screen/create_account_screen.dart';
import 'package:mycash_front/screens/home_screen/home_screen_controller.dart';

class AccountsScreen extends StatelessWidget {
  final HomeScreenController controller;

  const AccountsScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

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
            Obx(() {
              return Column(
                children: [
                  for (var account in controller.accounts)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: DetailedAccountItem(
                        title: account.name ?? '',
                        amount:
                            '${account.currencyType.shortName} ${account.balance ?? 0.00}',
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
                                    '¿Estás seguro de que quieres eliminar la cuenta "${account.name}"?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Text('Monto: PEN ${account.balance ?? 0.00}'),
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
                                    controller.deleteAccount(account.id);
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
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateAccountScreen(
                      controller: controller,
                    )),
          );
        },
        child: Icon(Icons.add, color: Colors.grey.shade300),
      ),
    );
  }
}
