import 'package:flutter/material.dart';
import 'package:mycash_front/components/detailed_account_item.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: 320,
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
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nueva Cuenta',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Transform.rotate(
                            angle: 90 * 3.14159 / 180,
                            child:
                                Icon(Icons.wifi, size: 36, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '1234 5678 9012 3456',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFormItem('Nombre', TextInputType.text),
                    const SizedBox(height: 20),
                    _buildCurrencyDropdown(),
                    const SizedBox(height: 20),
                    _buildFormItem('Importe', TextInputType.number),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildAddButton(context),
              const SizedBox(height: 200), // Extra space for keyboard
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormItem(String label, TextInputType inputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextFormField(
            keyboardType: inputType,
            style: TextStyle(color: Colors.black), // Text color for form field
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Ingrese el $label',
              hintStyle: TextStyle(color: Colors.grey), // Hint text color
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Moneda',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12),
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
                      child: Text(currency, style: TextStyle(color: Colors.black),),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Container(
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
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back
        },
        child: Text(
          'Agregar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
