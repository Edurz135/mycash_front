import 'package:mycash_front/model/currencyType_model.dart';

class Account {
  int id;
  String name;
  String? type;
  double balance;
  int userId;
  int? accountTypeId;
  int currencyTypeId;
  DateTime createdAt;
  DateTime updatedAt;
  CurrencyType currencyType;

  Account({
    required this.id,
    required this.name,
    this.type,
    required this.balance,
    required this.userId,
    this.accountTypeId,
    required this.currencyTypeId,
    required this.createdAt,
    required this.updatedAt,
    required this.currencyType,
  });
}
