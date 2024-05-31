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

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      balance: json['balance'].toDouble(),
      userId: json['userId'],
      accountTypeId: json['accountTypeId'],
      currencyTypeId: json['currencyTypeId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      currencyType: CurrencyType.fromJson(json['CurrencyType']),
    );
  }

}
