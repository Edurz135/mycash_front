import 'package:mycash_front/model/currencyType_model.dart';

class Transaction{
int id;
String type;
double amount;
DateTime creationDate;
DateTime modifiedDate;
DateTime deletedDate;
int? categoryId;
int currencyTypeId;
double exchange_rate;
int? accountId;
CurrencyType currencyType;

Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.creationDate,
    required this.modifiedDate,
    required this.deletedDate,
    this.categoryId,
    required this.currencyTypeId,
    required this.exchange_rate,
    this.accountId,
    required this.currencyType
});

factory Transaction.fromJson(Map<String,dynamic> json){
    return Transaction(
        id: json['id'],
        type : json['type'],
        amount: json['amount'],
        creationDate: DateTime.parse(json['creationDate']),
        modifiedDate: DateTime.parse(json['modifiedDate']),
        deletedDate: DateTime.parse(json['deletedDate']),
        categoryId: json['categoryId'],
        currencyTypeId: json['currencyTypeId'],
        exchange_rate: json['exchange_rate'],
        accountId: json['accountId'],
        currencyType: CurrencyType.fromJson(json['CurrencyType']),
    );
}
}