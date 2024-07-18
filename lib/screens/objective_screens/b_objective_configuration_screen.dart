//b_objetive_configuration_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:mycash_front/model/objective_model.dart';
import 'package:mycash_front/screens/objective_screens/objective_viewmodel.dart';

class CreateObjectiveScreen extends StatefulWidget {
  @override
  _CreateObjectiveScreenState createState() => _CreateObjectiveScreenState();
}

class _CreateObjectiveScreenState extends State<CreateObjectiveScreen> {
  final _formKey = GlobalKey<FormState>();
  int id = 0; 
  String _name = '';
  double _targetAmount = 0.0;
  double _savedAmount = 0.0;
  DateTime _deadline = DateTime.now();
  DateTime _createdAt = DateTime.now();
  DateTime _updatedAt = DateTime.now();
  Color _color = Colors.blue;
  IconData _icon = Icons.star;  

  final List<IconData> _iconOptions = [
    Icons.star,
    Icons.home,
    Icons.car_repair,
    Icons.beach_access,
    Icons.book,
    Icons.phone,
    Icons.laptop,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Crear Objetivo', 
          style: TextStyle(
            color: Colors.white, 
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Esto centra el título horizontalmente
        toolbarHeight: 120.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5986DF), Color(0xFFB156A8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Nombre de objetivo',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSaved: (value) => _name = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese un nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Cantidad del Objetivo',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) => _targetAmount = double.parse(value!),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese una cantidad';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor, ingrese un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Monto Ahorrado',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) => _savedAmount = double.parse(value!),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese un monto ahorrado';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor, ingrese un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Fecha deseada',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero, // Eliminar relleno predeterminado
                title: Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.white, // Fondo blanco
                    borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0), // Agrega padding izquierdo
                          child: Text(
                            '${_deadline.day}/${_deadline.month}/${_deadline.year}',
                            style: TextStyle(color: Colors.black), // Texto negro
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0), // Agrega padding derecho
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.black, // Color negro
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
                  color: Colors.white, // Fondo blanco
                  borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                ),
                child: SizedBox(
                  height: 60.0, // Altura deseada del contenedor
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0), // Agregar relleno vertical
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0), // Agrega padding izquierdo al texto
                          child: Text(
                            'Seleccione un color:',
                            style: TextStyle(color: Colors.black), // Texto negro
                          ),
                        ),
                        Spacer(), // Espacio entre el texto y el círculo
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0), // Agrega padding derecho al CircleAvatar
                          child: CircleAvatar(
                            backgroundColor: _color,
                            radius: 15, // Tamaño del CircleAvatar
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
                  color: Colors.white, // Fondo blanco
                  borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 6.0), // Agregar relleno vertical
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0), // Agrega padding izquierdo al texto
                        child: Text(
                          'Seleccione un icono:',
                          style: TextStyle(color: Colors.black), // Texto negro
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0), // Agrega padding derecho al icono
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black, // Color del borde
                          ),
                          padding: const EdgeInsets.all(1), // Grosor del borde
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white, // Color del icono
                            ),
                            padding: const EdgeInsets.all(10), // Espacio dentro del círculo del icono
                            child: Icon(
                              _icon,
                              size: 30,
                              color: Colors.black, // Color del icono
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Objective newObjective = Objective(
                      id:id,
                      name: _name,
                      targetAmount: _targetAmount,
                      savedAmount: _savedAmount,
                      deadline: _deadline,
                      color: _color,
                      icon: _icon, 
                      createdAt: _createdAt, 
                      updatedAt: _updatedAt,
                    );
                    Provider.of<ObjectivesViewModel>(context, listen: false).addObjective(newObjective);
                    Navigator.pop(context);
                  }
                },
                child: Ink(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    gradient: LinearGradient(colors: [Color(0xFF9C42C6), Color(0xFFE38466)]),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Agregar objetivo',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}