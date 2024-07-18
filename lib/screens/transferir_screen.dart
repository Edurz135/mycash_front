import 'package:flutter/material.dart';

class TransferirScreen extends StatefulWidget {
  @override
  _TransferirScreenState createState() => _TransferirScreenState();
}

class _TransferirScreenState extends State<TransferirScreen> {
  final TextEditingController _amountControllerFrom = TextEditingController();
  final TextEditingController _amountControllerTo = TextEditingController();
  String? selectedAccountFromName;
  String? selectedAccountToName;

  @override
  void dispose() {
    _amountControllerFrom.dispose();
    _amountControllerTo.dispose();
    super.dispose();
  }

  bool get isTransferButtonEnabled =>
      selectedAccountFromName != null && selectedAccountToName != null &&
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
              colors: [Color.fromRGBO(89, 134, 223, 1), Color.fromRGBO(177, 86, 168, 1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Asegura que los widgets ocupen solo el espacio necesario.
            mainAxisAlignment: MainAxisAlignment.center, // Centra los widgets en la dirección vertical.
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add, size: 40),
                          onPressed: () => _selectAccount(true),
                        ),
                        Text(selectedAccountFromName ?? 'Elegir', style: TextStyle(color: Colors.white, fontSize: 16)),
                        TextField(
                          controller: _amountControllerFrom,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Monto',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
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
                          onPressed: () => _selectAccount(false),
                        ),
                        Text(selectedAccountToName ?? 'Elegir', style: TextStyle(color: Colors.white, fontSize: 16)),
                        TextField(
                          controller: _amountControllerTo,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Monto',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40), // Espacio adicional entre los elementos
              ElevatedButton(
                onPressed: isTransferButtonEnabled ? _performTransfer : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isTransferButtonEnabled 
                        ? [Color.fromRGBO(89, 134, 223, 1), Color.fromRGBO(177, 86, 168, 1)]
                        : [Colors.grey, Colors.grey],
                    ),
                  ),
                  child: Text(
                    "Transferir",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectAccount(bool isFrom) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Seleccionar Cuenta"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  leading: Icon(Icons.account_balance_wallet, color: Colors.purple),
                  title: Text("Efectivo"),
                  subtitle: Text("PEN 930.00"),
                  onTap: () {
                    setState(() {
                      if (isFrom) {
                        selectedAccountFromName = "Efectivo";
                      } else {
                        selectedAccountToName = "Efectivo";
                      }
                      Navigator.of(context).pop();
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.credit_card, color: Colors.blue),
                  title: Text("Débito"),
                  subtitle: Text("PEN 1130.00"),
                  onTap: () {
                    setState(() {
                      if (isFrom) {
                        selectedAccountFromName = "Débito";
                      } else {
                        selectedAccountToName = "Débito";
                      }
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void _performTransfer() {
    print('Transferring from ${_amountControllerFrom.text} to ${_amountControllerTo.text}');
  }
}
