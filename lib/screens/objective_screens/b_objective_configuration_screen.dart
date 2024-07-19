import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:mycash_front/screens/objective_screens/objective_screen_controller.dart';

class CreateObjectiveScreen extends StatelessWidget {
  final ObjectiveController controller;

  const CreateObjectiveScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear nuevo objetivo'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(89, 134, 223, 1),
                Color.fromRGBO(177, 86, 168, 1),
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
              CreateObjectiveForm(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateObjectiveForm extends StatefulWidget {
  final ObjectiveController controller;

  const CreateObjectiveForm({super.key, required this.controller});

  @override
  CreateObjectiveFormState createState() {
    return CreateObjectiveFormState(controller: controller);
  }
}

class CreateObjectiveFormState extends State<CreateObjectiveForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _targetAmount = 0.0;
  double _savedAmount = 0.0;
  DateTime _deadline = DateTime.now();
  Color _color = Colors.blue;
  IconData _icon = Icons.star;

  ObjectiveController controller;
  CreateObjectiveFormState({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nombre de objetivo',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 5),
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
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Ingrese el Nombre',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Cantidad del Objetivo',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 5),
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
                  return 'Por favor, ingrese una cantidad';
                }
                return null;
              },
              onSaved: (value) {
                _targetAmount = double.tryParse(value ?? "") ?? 0.0;
              },
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Ingrese el objetivo de ahorro',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Monto Ahorrado',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 5),
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
                  return 'Por favor, ingrese una cantidad';
                }
                return null;
              },
              onSaved: (value) {
                _savedAmount = double.tryParse(value ?? "") ?? 0.0;
              },
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Ingrese el monto de ahorro',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Fecha deseada',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${_deadline.day}/${_deadline.month}/${_deadline.year}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _deadline,
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );
              if (picked != null && picked != _deadline) {
                setState(() {
                  _deadline = picked;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Color del objetivo',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SizedBox(
              height: 60.0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Seleccione un color:',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        backgroundColor: _color,
                        radius: 15,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Seleccione un color'),
                        content: SingleChildScrollView(
                          child: BlockPicker(
                            pickerColor: _color,
                            onColorChanged: (color) {
                              setState(() {
                                _color = color;
                              });
                            },
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Seleccionar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Icono',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 6.0),
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Seleccione un icono:',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          _icon,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Seleccione un icono'),
                      content: SingleChildScrollView(
                        child: Wrap(
                          spacing: 10,
                          children: _iconOptions.map((icon) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _icon = icon;
                                });
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                icon,
                                size: 40,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                );
              },
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
                  Color.fromRGBO(177, 86, 168, 1),
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
                  controller.createObjective(
                    _name,
                    _targetAmount,
                    _savedAmount,
                    _deadline,
                    _color,
                    _icon,
                  );
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
          ),
        ],
      ),
    );
  }

  static const List<IconData> _iconOptions = [
    Icons.star,
    Icons.favorite,
    Icons.home,
    Icons.work,
    Icons.school,
    Icons.fitness_center,
    Icons.directions_car,
    Icons.pets,
  ];
}
