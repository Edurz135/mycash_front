import 'package:get/get.dart';
import 'package:mycash_front/model/transaction.dart';
import 'package:mycash_front/services/transaction_service.dart';

class TransactionDetailScreenController extends GetxController {
  RxList<Transaction> transaccions = <Transaction>[].obs;

  TransactionDetailScreenController(){
    //O.o
  }

  Future<void> fetchTransactions() async{
    try {
      final List<Transaction> fetchedTransactions =
          await TransactionService.fetchTransactions();
      transaccions.assignAll(fetchedTransactions);
    } catch (error) {
      print('Failed to fetch transactions: $error');
    }
  }

  Future<void> editTransaction(Transaction transaction) async {
    try {
      await TransactionService.editTransaction(transaction);
      fetchTransactions();
    } catch (error) {
      print("Error editing transaction: $error");
    }
  }

  Future<void> deleteTransaction(int id) async {
    try {
      print('Deleting account');
      TransactionService.deleteTransaction(id).then((_){
        fetchTransactions();
      });
    } catch (error) {
      print("Error deleting account: $error");
    }
  }
}