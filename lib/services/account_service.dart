import 'dart:convert';
import 'package:http/http.dart' as http;

class AccountService {
  static Future<List<Map<String, dynamic>>> fetchAccounts(String token) async {
    final url = Uri.parse('http://10.0.2.2:3000/api/accounts/');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load accounts');
    }
  }

  static Future<void> createAccount(
    String token,
    String name,
    double balance,
    int currencyTypeId,
  ) async {
    final url = Uri.parse('http://10.0.2.2:3000/api/accounts/');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
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
}
