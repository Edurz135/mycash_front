import 'package:flutter/material.dart';

class TrasferirScreen extends StatefulWidget {
  @override
  _TrasferirScreenState createState() => _TrasferirScreenState();
}

class _TrasferirScreenState extends State<TrasferirScreen> {
  final TextEditingController _amountControllerFrom = TextEditingController();
  final TextEditingController _amountControllerTo = TextEditingController();

  @override
  void dispose() {
    _amountControllerFrom.dispose();
    _amountControllerTo.dispose();
    super.dispose();
  }

  bool get isTransferButtonEnabled =>
      _amountControllerFrom.text.isNotEmpty && _amountControllerTo.text.isNotEmpty;

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
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, size: 40),
                        onPressed: () {
                          // Implement functionality
                        },
                      ),
                      TextField(
                        controller: _amountControllerFrom,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Monto',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (value) => setState(() {}),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward, size: 40),
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, size: 40),
                        onPressed: () {
                          // Implement functionality
                        },
                      ),
                      TextField(
                        controller: _amountControllerTo,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Monto',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (value) => setState(() {}),
                      ),
                    ],
                  ),
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
          Padding(
            padding: EdgeInsets.all(40),
            child: Container(
              width: double.infinity,
              height: 50, // Reduced height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isTransferButtonEnabled 
                    ? [Color.fromRGBO(89, 134, 223, 1), Color.fromRGBO(177, 86, 168, 1)]
                    : [Colors.grey, Colors.grey], // Grey gradient when disabled
                ),
              ),
              child: ElevatedButton(
                onPressed: isTransferButtonEnabled ? _performTransfer : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent), // Make background transparent
                  shadowColor: MaterialStateProperty.all(Colors.transparent), // No shadow
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  "Transferir",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _performTransfer() {
    // Implement the transfer logic here
    print('Transferring from ${_amountControllerFrom.text} to ${_amountControllerTo.text}');
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
