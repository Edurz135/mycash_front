import 'package:get/get.dart';
import 'package:mycash_front/model/account_model.dart';
import 'package:mycash_front/services/account_service.dart';

class ProfileScreenController extends GetxController {
  RxList<Account> accounts = <Account>[].obs;

  ProfileScreenController(){
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
}