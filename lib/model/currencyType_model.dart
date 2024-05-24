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
}