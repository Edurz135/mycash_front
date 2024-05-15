import 'package:flutter/material.dart';
import 'package:mycash_front/components/creditcard_item.dart';
import 'package:mycash_front/services/account_service.dart';

class CreateAccountScreen extends StatelessWidget {
  final Function(String name, int currencyTypeId, double balance) createAccount;
  final List<Map<String, dynamic>> currencyTypes;

  const CreateAccountScreen(
      {Key? key, required this.currencyTypes, required this.createAccount})
      : super(key: key);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CreditCardItem(),
              const SizedBox(height: 20),
              CreateAccountForm(
                  currencyTypes: currencyTypes, createAccount: createAccount)
            ],
          ),
        ),
      ),
    );
  }
}

class CreateAccountForm extends StatefulWidget {
  final List<Map<String, dynamic>> currencyTypes;
  final Function(String name, int currencyTypeId, double balance) createAccount;

  const CreateAccountForm(
      {super.key, required this.currencyTypes, required this.createAccount});

  @override
  CreateAccountFormState createState() {
    return CreateAccountFormState(
        currencyTypes: currencyTypes, createAccount: createAccount);
  }
}

class CreateAccountFormState extends State<CreateAccountForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> currencyTypes;
  final Function(String name, int currencyTypeId, double balance) createAccount;

  String _name = '';
  int _currencyTypeId = 0;
  double _balance = 0.0;

  CreateAccountFormState(
      {required this.currencyTypes, required this.createAccount});

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
            child: DropdownButtonFormField<Map<String, dynamic>>(
              value: currencyTypes.isNotEmpty
                  ? currencyTypes[0]
                  : null, // Set initial value if available
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              items: currencyTypes
                  .map<DropdownMenuItem<Map<String, dynamic>>>(
                      (currency) => DropdownMenuItem<Map<String, dynamic>>(
                            value: currency,
                            child: Text(
                              '${currency['short_name']} - ${currency['name']}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ))
                  .toList(),
              dropdownColor: Colors.white,
              onChanged: (value) {
                // Update _currencyTypeId when an item is selected
                setState(() {
                  _currencyTypeId = value!['id'] as int;
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
                  createAccount(_name, _currencyTypeId, _balance);
                  Navigator.of(context).pop();
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
