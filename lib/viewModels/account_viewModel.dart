import 'package:flutter/material.dart';
import 'package:mycash_front/model/account_model.dart';

class AccountViewModel extends ChangeNotifier {
  List<Account> _accounts = [];

  List<Account> get accounts => _accounts;

  void addAccount(Account account) {
    _accounts.add(account);
    notifyListeners();
  }

  void removeAccount(Account account) {
    _accounts.remove(account);
    notifyListeners();
  }

  void updateAccount(Account oldAccount, Account newAccount) {
    final index = _accounts.indexOf(oldAccount);
    if (index != -1) {
      _accounts[index] = newAccount;
      notifyListeners();
    }
  }
}
