import 'package:flutter/material.dart';

class IncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ingresos", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(89, 134, 223, 1),
                    Color.fromRGBO(177, 86, 168, 1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
      ),
      body: Column(
        children: [

        ],    
      )
    );
  }
}

