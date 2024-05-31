import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycash_front/model/currencyType_model.dart';
import 'package:mycash_front/services/api_config.dart';

class CurrencyTypeService {
  static Future<List<CurrencyType>> fetchCurrencyTypes() async {
    final url = Uri.parse('${APIConfig.baseURL}currencyType/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CurrencyType.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load currency types');
    }
  }
}
