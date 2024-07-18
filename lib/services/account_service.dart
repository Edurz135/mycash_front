import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycash_front/model/account_model.dart';
import 'package:mycash_front/services/api_config.dart';

class AccountService {
  static Future<List<Account>> fetchAccounts() async {
    final url = Uri.parse('${APIConfig.baseURL}accounts/');
    print("Calling API: GET $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${await APIConfig.getToken()}'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print("API Response: ${response.body}");
      return data.map((json) => Account.fromJson(json)).toList();
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to load accounts');
    }
  }

  static Future<void> createAccount(
    String name,
    double balance,
    int currencyTypeId,
  ) async {
    final url = Uri.parse('${APIConfig.baseURL}accounts/');
    print("Calling API: POST $url");
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${await APIConfig.getToken()}',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': name,
        'balance': balance,
        'currencyTypeId': currencyTypeId,
      }),
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to create account');
    }
  }

  static Future<void> deleteAccount(int id) async {
    final url = Uri.parse('${APIConfig.baseURL}accounts/$id');
    print("Calling API: DELETE $url");
    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer ${await APIConfig.getToken()}'},
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to delete account');
    }
  }
}
