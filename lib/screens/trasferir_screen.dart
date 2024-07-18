import 'package:flutter/material.dart';

class TrasferirScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferencia", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(89, 134, 223, 1),
                Color.fromRGBO(177, 86, 168, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.add, size: 40),
                  onPressed: () {}, // Implement functionality
                ),
                Icon(Icons.arrow_forward, size: 40),
                IconButton(
                  icon: Icon(Icons.add, size: 40),
                  onPressed: () {}, // Implement functionality
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cuentas", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildAccountTile("Efectivo", "PEN 930.00"),
                        _buildAccountTile("Debito", "PEN 1130.00"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountTile(String accountType, String balance) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9C42C6), Color(0xFFE38466)],
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(accountType, style: TextStyle(fontSize: 18, color: Colors.white)),
          Text(balance, style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}

