import 'package:get/get.dart';
import 'package:mycash_front/model/account_model.dart';
import 'package:mycash_front/services/account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenController extends GetxController {
  RxList<Account> accounts = <Account>[].obs;
  String currentAcc = "";
  String url = "";

  ProfileScreenController(){

    // accounts.addAll(baseData);
    // fetchAccounts();
    // fetchCurrencyTypes();
  }
  Future<void> fetchAccounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentAcc = prefs.getString("name")!;
    url = prefs.getString("profile_picture")!;
    print("profile pic is:");
    print(url);
    try {
      final List<Account> fetchedAccounts =
          await AccountService.fetchAccounts();
      accounts.assignAll(fetchedAccounts);
    } catch (error) {
      print('Failed to fetch accounts: $error');
    }


  }
}