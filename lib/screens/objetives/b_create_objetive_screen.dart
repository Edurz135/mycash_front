import 'package:flutter/material.dart';
import 'package:mycash_front/screens/objetives/c_objective_configuration_screen.dart';
import 'package:mycash_front/data/data.dart';

class CreateObjetiveScreen extends StatefulWidget {
  const CreateObjetiveScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateObjetiveScreenState createState() => _CreateObjetiveScreenState();
}

class _CreateObjetiveScreenState extends State<CreateObjetiveScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? selectedCategory;
  final categories = Data.objetivosPredeterminados;

  void _onNextPressed() {
    if (_nameController.text.isNotEmpty || selectedCategory != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ObjectiveConfigurationScreen(
            name: _nameController.text,
            category: selectedCategory,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Por favor, ingrese un nombre o seleccione una categoría.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla principal
          },
        ),
        title: const Text(
          'Crear Nuevo Objetivo', 
          style: TextStyle(
            color: Colors.white, 
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¿Para qué desea ahorrar?',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
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
              onChanged: (text) {
                setState(() {
                  if (text.isNotEmpty) {
                    selectedCategory = null; // Limpiar categoría seleccionada si hay texto
                  }
                });
              },
            ),
            const SizedBox(height: 20),

            const Row(
              children: [
                Expanded(
                  child: Divider(color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'o',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Divider(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            const Text(
              'Algunas cosas para las que ahorra la gente:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category.name;
                        _nameController.clear(); // Limpiar el campo de texto si se selecciona una categoría
                      });
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: selectedCategory == category.name
                              ? const Color.fromARGB(255, 156, 66, 198)
                              : Colors.white,
                          child: Icon(
                            category.icon,
                            color: selectedCategory == category.name ? Colors.white : Colors.black,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          category.name,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: _onNextPressed,
                child: Ink(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(156, 66, 198, 1),
                        Color(0xFFE38466)
                      ],
                    ),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 88.0, minHeight: 38.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text(
                      'Siguiente',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
