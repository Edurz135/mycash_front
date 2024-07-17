import 'package:get/get.dart';
import 'package:mycash_front/model/category.dart';
import 'package:mycash_front/model/transaction.dart';
import 'package:mycash_front/services/transaction_service.dart';
import 'package:mycash_front/services/category_service.dart';

class TransaccionScreenController extends GetxController {
  RxList<Transaction> transaccions = <Transaction>[].obs;
  RxList<Category> categories = <Category>[].obs;

  TransaccionScreenController(){
    //zzz;
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

  Future<void> fetchCategories() async{
    try {
      final List<Category> fetchedCategories =
          await CategoryService.fetchCategories();
      categories.assignAll(fetchedCategories);
    } catch (error) {
      print('Failed to fetch transactions: $error');
    }
  }
  
  String getCategoryNameById(int id) {
    var category = categories.firstWhereOrNull((category) => category.id == id);
    return category?.name ?? 'Unknown';
  }
}