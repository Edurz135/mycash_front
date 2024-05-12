import 'package:flutter/material.dart';
import 'package:mycash_front/components/creditcard_item.dart';
import 'package:mycash_front/services/account_service.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cuenta'),
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              CreditCardItem(),
              SizedBox(height: 20),
              CreateAccountForm()
            ],
          ),
        ),
      ),
    );
  }
}

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  CreateAccountFormState createState() {
    return CreateAccountFormState();
  }
}

class CreateAccountFormState extends State<CreateAccountForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int _currencyTypeId = 0;
  double _balance = 0.0;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nombre',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un nombre';
                }
                return null;
              },
              onSaved: (value) {
                _name = value ?? "";
              },
              keyboardType: TextInputType.text,
              style: const TextStyle(
                  color: Colors.black), // Text color for form field
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Ingrese el Nombre',
                hintStyle: TextStyle(color: Colors.grey), // Hint text color
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Moneda',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              items: ['Dollar', 'Soles', 'Euro']
                  .map((currency) => DropdownMenuItem<String>(
                        value: currency,
                        child: Text(
                          currency,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ))
                  .toList(),
              dropdownColor: Colors.white,
              onChanged: (value) {
                // Update _currencyTypeId when an item is selected
                setState(() {
                  if (value == 'Dollar') {
                    _currencyTypeId = 1; // Assuming 1 represents Dollar
                  } else if (value == 'Soles') {
                    _currencyTypeId = 2; // Assuming 2 represents Soles
                  } else if (value == 'Euro') {
                    _currencyTypeId = 3; // Assuming 3 represents Euro
                  }
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Por favor seleccione una moneda'; // Error message if no item is selected
                }
                return null; // Return null if validation succeeds
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Importe',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un importe';
                }
                return null;
              },
              onSaved: (value) {
                _balance = double.tryParse(value ?? "") ?? 0.0;
              },
              keyboardType: TextInputType.number,
              style: const TextStyle(
                  color: Colors.black), // Text color for form field
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Ingrese el importe',
                hintStyle: TextStyle(color: Colors.grey), // Hint text color
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _createAccount(context, _name, _currencyTypeId, _balance);
                }
              },
              child: const Text(
                'Agregar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _createAccount(
    BuildContext context, String name, int currencyTypeId, double balance) {
  // Call the service to create the account
  AccountService.createAccount(
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE1MjkwNzY4LCJleHAiOjE3MTUzNzcxNjh9.xVm4UPAUqb6f4Ai3WlM5crpHGlYHgIx-s1Av7kJ-6wM",
    name,
    balance,
    currencyTypeId,
  ).then((_) {
    // Account created successfully, navigate back
    Navigator.pop(context);
  }).catchError((error) {
    // Handle errors if any
    print("Error creating account: $error");
    // You can show an error message to the user if needed
  });
}
