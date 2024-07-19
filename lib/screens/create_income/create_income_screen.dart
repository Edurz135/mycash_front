import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/model/account_model.dart';
import 'package:mycash_front/model/transaction.dart';
import 'package:mycash_front/screens/home_screen/home_screen_controller.dart';

class CreateIncomeScreen extends StatelessWidget {
  final HomeScreenController controller;

  const CreateIncomeScreen({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ingreso'),
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
              const SizedBox(height: 20),
              CreateIncomeForm(
                controller: controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CreateIncomeForm extends StatefulWidget {
  final HomeScreenController controller;
  const CreateIncomeForm({super.key, required this.controller});

  @override
  CreateIncomeFormState createState() {
    return CreateIncomeFormState(controller: controller);
  }
}

class CreateIncomeFormState extends State<CreateIncomeForm> {
  final _formKey = GlobalKey<FormState>();

  int _idacc = 1;
  String _type =  " ";
  int _currencyTypeId = 1;
  double _amount = 0.0;
  int _ctg = 1;
  double? _exrt = 0.0;

  HomeScreenController controller;

  CreateIncomeFormState({required this.controller});

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
                _type = value ?? "";
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(
                    color: Colors.black), // Color del texto del campo de formulario
                decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Ingrese el nombre',
                hintStyle: TextStyle(color: Colors.grey), // Color del texto de sugerencia
                ),
            ),
            ),
        const Text(
            'Cuenta',
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
                //value: _currencyTypeId,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                items: controller.accounts
                    .map<DropdownMenuItem<int>>(
                        (account) => DropdownMenuItem<int>(
                              value: account.id,
                              child: Text(
                                '${account.name}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ))
                    .toList(),
                dropdownColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _idacc = value!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor seleccione una cuenta';
                  }
                  return null;
                },
              ),
            );
          }),
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
                _amount = (double.tryParse(value ?? "") ?? 0.0);
                },
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Colors.black), // Color del texto del campo de formulario
                decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Ingrese el importe',
                hintStyle: TextStyle(color: Colors.grey), // Color del texto de sugerencia
                ),
            ),
            ),
            const Text(
            'Categoria',
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
                //value: _currencyTypeId,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                items: controller.categories
                    .map<DropdownMenuItem<int>>(
                        (ctg) => DropdownMenuItem<int>(
                              value: ctg.id,
                              child: Text(
                                '${ctg.name}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ))
                    .toList(),
                dropdownColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _ctg = value!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor seleccione una categoria';
                  }
                  return null;
                },
              ),
            );
          }),
            const Text(
            'Tasa de cambio',
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
                    return 'Por favor ingrese TC';
                }
                return null;
                },
                onSaved: (value) {
                _exrt = (double.tryParse(value ?? "") ?? 0.0) * -1;
                },
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Colors.black), // Color del texto del campo de formulario
                decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Ingrese tasa de cambio',
                hintStyle: TextStyle(color: Colors.grey), // Color del texto de sugerencia
                ),
            ),
            ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  controller.createTransaction(
                      _amount,_type,_idacc,_ctg, _currencyTypeId as int, _exrt);
                  // createAccount(_name, _currencyTypeId, _balance);
                  /*
                  amount, 
        accountId,
        categoryId, 
        currencyTypeId, 
        exchange_rate,*/
                  /*
                   int _idacc;
  int _currencyTypeId;
  double _amount = 0.0;
  int _ctg;
  double? _exrt = 0.0;
  */
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
