class Transaction {
  final int id;
  final String type;
  final double amount;
  final double? exchangeRate;
  final int categoryId;
  final int accountId;
  final int currencyTypeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    this.exchangeRate,
    required this.categoryId,
    required this.accountId,
    required this.currencyTypeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      type: json['type']?? '',
      amount: json['amount'].toDouble(),
      exchangeRate: json['exchange_rate'].toDouble(), // Esto puede ser nulo
      categoryId: json['categoryId'],
      accountId: json['accountId'],
      currencyTypeId: json['currencyTypeId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'amount': amount,
      'exchange_rate': exchangeRate,
      'categoryId': categoryId,
      'accountId': accountId,
      'currencyTypeId': currencyTypeId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
