import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/components/creditcard_item.dart';
import 'package:mycash_front/model/account_model.dart';
import 'package:mycash_front/screens/home_screen/home_screen_controller.dart';

class CreateAccountScreen extends StatelessWidget {
  final HomeScreenController controller;

  const CreateAccountScreen({Key? key, required this.controller})
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
                controller: controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CreateAccountForm extends StatefulWidget {
  final HomeScreenController controller;
  const CreateAccountForm({super.key, required this.controller});

  @override
  CreateAccountFormState createState() {
    return CreateAccountFormState(controller: controller);
  }
}

class CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int? _currencyTypeId;
  double _balance = 0.0;

  HomeScreenController controller;

  CreateAccountFormState({required this.controller});

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
          Obx(() {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButtonFormField<int>(
                value: _currencyTypeId,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                items: controller.currencyTypes
                    .map<DropdownMenuItem<int>>(
                        (currency) => DropdownMenuItem<int>(
                              value: currency.id,
                              child: Text(
                                '${currency.shortName} - ${currency.name}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ))
                    .toList(),
                dropdownColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _currencyTypeId = value!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor seleccione una moneda';
                  }
                  return null;
                },
              ),
            );
          }),
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
                  controller.createAccount(
                      _name, _currencyTypeId as int, _balance);
                  // createAccount(_name, _currencyTypeId, _balance);
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
