import 'package:flutter/material.dart';
import 'package:mycash_front/components/detailed_account_item.dart';
import 'package:mycash_front/screens/create_account_screen.dart';
import 'package:mycash_front/services/account_service.dart'; // Import your AccountService

class AccountsScreen extends StatefulWidget {
  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  List<Map<String, dynamic>> accounts = [];

  @override
  void initState() {
    super.initState();
    fetchAccounts();
  }

  Future<void> fetchAccounts() async {
    try {
      final List<Map<String, dynamic>> fetchedAccounts = await AccountService.fetchAccounts('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE1MjkwNzY4LCJleHAiOjE3MTUzNzcxNjh9.xVm4UPAUqb6f4Ai3WlM5crpHGlYHgIx-s1Av7kJ-6wM'); // Make sure to replace `token` with your actual token
      setState(() {
        accounts = fetchedAccounts;
      });
    } catch (e) {
      print('Error fetching accounts: $e');
      // Handle error appropriately, e.g., show a snackbar
    }
  }

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
