import 'package:flutter/material.dart';
import 'package:mycash_front/components/detailed_account_item.dart';
import 'package:mycash_front/screens/create_account_screen.dart';
import 'package:mycash_front/services/account_service.dart'; // Import your AccountService

class AccountsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> accounts;
  final VoidCallback fetchAccounts;
  
  const AccountsScreen(
      {Key? key, required this.accounts, required this.fetchAccounts})
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
            for (var account in accounts)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: DetailedAccountItem(
                  title: account['name'] ?? '',
                  amount: 'PEN ${account['balance'] ?? 0.00}',
                  onEditPressed: () {
                    // Implement edit functionality here
                    print('Edit button pressed');
                  },
                  onDeletePressed: () {
                    // Show confirmation dialog before deleting
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text('Monto: PEN ${account['balance'] ?? 0.00}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              //ELIMINAR
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Call delete function here
                              _deleteAccount(
                                  context, account['id'], fetchAccounts);
                              // For now, just print a message
                              print('Deleting account');
                              Navigator.of(context).pop(); // Close the dialog
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateAccountScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.grey.shade300),
      ),
    );
  }
}

void _deleteAccount(BuildContext context, int id, VoidCallback fetchAccounts) {
  // Call the service to create the account
  AccountService.deleteAccount(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE1MjkwNzY4LCJleHAiOjE3MTUzNzcxNjh9.xVm4UPAUqb6f4Ai3WlM5crpHGlYHgIx-s1Av7kJ-6wM",
          id)
      .then((_) {
    fetchAccounts();
    // Account created successfully, navigate back
    // Navigator.pop(context);
  }).catchError((error) {
    // Handle errors if any
    print("Error deleting account: $error");
    // You can show an error message to the user if needed
  });
}
