import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/model/account_model.dart';
import 'package:mycash_front/services/account_service.dart';
import 'package:mycash_front/services/transaction_service.dart';

class TransferirScreen extends StatefulWidget {
  @override
  _TransferirScreenState createState() => _TransferirScreenState();
}

class _TransferirScreenState extends State<TransferirScreen> {
  final TextEditingController _amountController = TextEditingController();
  //final TextEditingController _amountControllerTo = TextEditingController();
  String? selectedAccountFromName;
  String? selectedAccountToName;
  RxList<Account> accounts = <Account>[].obs;
  Account? fromAcc;
  Account? toAcc;

  @override
  void dispose() {
    _amountController.dispose();
    //_amountControllerTo.dispose();
    super.dispose();
  }

  Future<void> fetchAccounts() async {
    try {
      final List<Account> fetchedAccounts =
          await AccountService.fetchAccounts();
      accounts.assignAll(fetchedAccounts);
      for(Account acc in accounts){
        debugPrint("ACCOUNT");
        debugPrint(acc.currencyType.name);
        debugPrint("${acc.balance}");
        debugPrint("${acc.id}");
      }
      setState(() {});
    } catch (error) {
      print('Failed to fetch accounts: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAccounts();
  }
/*
  bool get isTransferButtonEnabled =>
      toAcc != null && fromAcc != null &&
      _amountController.text.isNotEmpty &&  toAcc?.id != fromAcc?.id;
      */
bool get isTransferButtonEnabled =>
      toAcc != null && fromAcc != null &&
      _amountController.text.isNotEmpty &&
      toAcc?.id != fromAcc?.id && double.parse(_amountController.text) <= (fromAcc!.balance);
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
                        Text(fromAcc?.name ?? 'Elegir', style: TextStyle(color: Colors.white, fontSize: 16)),
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
                        //Text(toAcc == null ? 'Elegir' : toAcc!.name, style: TextStyle(color: Colors.white, fontSize: 16)),
                        Text(toAcc?.name ?? 'Elegir', style: TextStyle(color: Colors.white, fontSize: 16)),
                        /*
                        TextField(
                          controller: _amountControllerTo,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Monto',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: TextField(
                          controller: _amountController,
                          onChanged: (value) => {setState(() {})},
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Monto',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                  )
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
          title: const Text("Seleccionar Cuenta"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                for(Account acc in accounts)
                  ListTile(
                    leading: const Icon(Icons.account_balance_wallet, color: Colors.purple),
                    title: Text(acc.name),
                    subtitle: Text("${acc.currencyType.name} - ${acc.balance}"),
                    onTap: () {
                      setState(() {
                        if (isFrom) {
                          fromAcc = acc;
                        } else {
                          toAcc = acc;
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
  Future<void> _performTransfer() async {
    bool success = await TransactionService.transfer(fromAcc!.id,toAcc!.id,double.parse(_amountController.text));
    if(success) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 5),
            content: Text('Se ha realizado la transferencia exitosamente.'),
          )
        );
    }
  }
}
