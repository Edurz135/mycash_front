import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycash_front/services/api_config.dart';

class CurrencyTypeService {
  static Future<List<Map<String, dynamic>>> fetchCurrencyTypes() async {
    final url = Uri.parse('${APIConfig.baseURL}currencyType/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load currency types');
    }
  }
}
