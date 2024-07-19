import 'package:get/get.dart';
import 'package:mycash_front/model/account_model.dart';
import 'package:mycash_front/model/category.dart';
import 'package:mycash_front/model/currencyType_model.dart';
import 'package:mycash_front/model/transaction.dart';
import 'package:mycash_front/services/account_service.dart';
import 'package:mycash_front/services/category_service.dart';
import 'package:mycash_front/services/currencyType_service.dart';
import 'package:mycash_front/services/transaction_service.dart';

import 'package:mycash_front/screens/profile/profile_screen_controller.dart';
import 'package:mycash_front/services/user_service.dart';

class HomeScreenController extends GetxController {
  RxList<Account> accounts = <Account>[].obs;
  RxList<CurrencyType> currencyTypes = <CurrencyType>[].obs;
  RxList<Transaction> transaccions = <Transaction>[].obs;
  RxList<Category> categories = <Category>[].obs;

  HomeScreenController() {
    // accounts.addAll(baseData);
    // fetchAccounts();
    // fetchCurrencyTypes();
  }

  Future<void> fetchAccounts() async {
    try {
      final List<Account> fetchedAccounts =
          await AccountService.fetchAccounts();
      accounts.assignAll(fetchedAccounts);
    } catch (error) {
      print('Failed to fetch accounts: $error');
    }
  }

  Future<void> fetchCurrencyTypes() async {
    try {
      final List<CurrencyType> fetchedCurrencyTypes =
          await CurrencyTypeService.fetchCurrencyTypes();
      currencyTypes.assignAll(fetchedCurrencyTypes);
    } catch (error) {
      print('Failed to fetch currency types: $error');
    }
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

  String getCategoryNameById(int id) {
    var category = categories.firstWhereOrNull((category) => category.id == id);
    return category?.name ?? 'Unknown';
  }
 
  Future<void> createAccount(
      String name, int currencyTypeId, double balance) async {
    try {
      AccountService.createAccount(
        name,
        balance,
        currencyTypeId,
      ).then((_) async => {await fetchAccounts()});
    } catch (error) {
      print("Error creating account: $error");
    }
  }

  Future<void> createTransaction(
      double amount, String type,int accountId, int categoryId, int currencyTypeId, double? exchange_rate) async {
    try {
      TransactionService.createTransaction(
        amount, 
        type,
        accountId,
        categoryId, 
        currencyTypeId, 
        exchange_rate!,
      ).then((_) async => {await fetchTransactions()});
    } catch (error) {
      print("Error creating transaction: $error");
    }
  }

  Future<void> deleteAccount(int id) async {
    try {
      print('Deleting account');
      AccountService.deleteAccount(id).then((_) {
        fetchAccounts();
      });
    } catch (error) {
      print("Error deleting account: $error");
    }
  }

  List<Account> accountData = [
    Account(
        id: 1,
        name: "Cuenta1",
        balance: 1000,
        userId: 1,
        currencyTypeId: 1,
        createdAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
        updatedAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
        currencyType: CurrencyType(
            id: 2,
            name: "Nuevo Sol",
            shortName: "PEN",
            symbol: "S/.",
            baseExchangeRate: 3.7,
            createdAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
            updatedAt: DateTime.parse("2024-05-20T15:28:19.000Z"))),
    Account(
        id: 1,
        name: "Cuenta2",
        balance: 2000,
        userId: 1,
        currencyTypeId: 1,
        createdAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
        updatedAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
        currencyType: CurrencyType(
            id: 2,
            name: "Nuevo Sol",
            shortName: "PEN",
            symbol: "S/.",
            baseExchangeRate: 3.7,
            createdAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
            updatedAt: DateTime.parse("2024-05-20T15:28:19.000Z"))),
    Account(
        id: 1,
        name: "Cuenta3",
        balance: 3000,
        userId: 1,
        currencyTypeId: 1,
        createdAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
        updatedAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
        currencyType: CurrencyType(
            id: 2,
            name: "Nuevo Sol",
            shortName: "PEN",
            symbol: "S/.",
            baseExchangeRate: 3.7,
            createdAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
            updatedAt: DateTime.parse("2024-05-20T15:28:19.000Z")))
  ];

  List<CurrencyType> currencyData = [
    CurrencyType(
        id: 1,
        name: "Dólar",
        shortName: "USD",
        symbol: "\$",
        baseExchangeRate: 1,
        createdAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
        updatedAt: DateTime.parse("2024-05-20T15:28:19.000Z")),
    CurrencyType(
        id: 2,
        name: "Nuevo Sol",
        shortName: "PEN",
        symbol: "S/.",
        baseExchangeRate: 3.7,
        createdAt: DateTime.parse("2024-05-20T15:28:19.000Z"),
        updatedAt: DateTime.parse("2024-05-20T15:28:19.000Z"))
  ];
}
