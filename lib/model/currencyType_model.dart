class CurrencyType {
  int id;
  String name;
  String shortName;
  String symbol;
  double baseExchangeRate;
  DateTime createdAt;
  DateTime updatedAt;

  CurrencyType({
    required this.id,
    required this.name,
    required this.shortName,
    required this.symbol,
    required this.baseExchangeRate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CurrencyType.fromJson(Map<String, dynamic> json) {
    return CurrencyType(
      id: json['id'],
      name: json['name'],
      shortName: json['short_name'],
      symbol: json['symbol'],
      baseExchangeRate: json['base_exchange_rate'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

}