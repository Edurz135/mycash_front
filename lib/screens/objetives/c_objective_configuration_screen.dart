import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mycash_front/data/data.dart';

class ObjectiveConfigurationScreen extends StatefulWidget {
  final String name;
  final String? category;

  const ObjectiveConfigurationScreen({super.key, required this.name, this.category});

  @override
  _ObjectiveConfigurationScreenState createState() => _ObjectiveConfigurationScreenState();
}

class _ObjectiveConfigurationScreenState extends State<ObjectiveConfigurationScreen> {
  late TextEditingController _nameController;
  final TextEditingController _goalAmountController = TextEditingController();
  final TextEditingController _savedAmountController = TextEditingController();
  DateTime? _selectedDate;
  Color _selectedColor = Colors.orange;
  IconData _selectedIcon = Icons.home;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.name.isNotEmpty ? widget.name : widget.category ?? '',
    );
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _pickColor() async {
    Color picked = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccione un color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  _selectedColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop(_selectedColor);
              },
            ),
          ],
        );
      },
    );

    setState(() {
      _selectedColor = picked;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        
        title: const Text(
          'Crear Nuevo Objetivo',
          style: TextStyle(color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 80.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nombre',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Nombre del objetivo',
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Cantidad del Objetivo',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: _goalAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Ya ahorrado',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),

              TextField(
                style: const TextStyle(color: Colors.black),
                controller: _savedAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Fecha deseada',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),
              
              InkWell(
                onTap: _pickDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate != null
                            ? DateFormat.yMd().format(_selectedDate!)
                            : 'dd/mm/yyyy',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      const Icon(Icons.calendar_today, color: Colors.black54),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Color del objetivo',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: _pickColor,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _selectedColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Icono',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField<IconData>(
                value: _selectedIcon,
                items: Data.objetivosPredeterminados.map((category) {
                  return DropdownMenuItem<IconData>(
                    value: category.icon,
                    child: Row(
                      children: [
                        Icon(category.icon),
                        const SizedBox(width: 10),
                        Text(category.name),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (IconData? newValue) {
                  setState(() {
                    _selectedIcon = newValue!;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    // Lógica para agregar el objetivo
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}