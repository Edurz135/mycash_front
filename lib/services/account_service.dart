import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycash_front/services/api_config.dart';

class AccountService {
  static Future<List<Map<String, dynamic>>> fetchAccounts() async {
    final url = Uri.parse('${APIConfig.baseURL}accounts/');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${APIConfig.token}'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load accounts');
    }
  }

  static Future<void> createAccount(
    String name,
    double balance,
    int currencyTypeId,
  ) async {
    final url = Uri.parse('${APIConfig.baseURL}accounts/');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${APIConfig.token}',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': name,
        'balance': balance,
        'currencyTypeId': currencyTypeId,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create account');
    }
  }

  static Future<void> deleteAccount(int id) async {
    final url = Uri.parse('${APIConfig.baseURL}accounts/$id');
    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer ${APIConfig.token}'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete account');
    }
  }
}
