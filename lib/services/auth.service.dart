import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycash_front/model/User.dart';
import 'package:mycash_front/services/api_config.dart';

class AuthService {
  
  static Future<void> signup(
    String first_name,
    String last_name,
    String email, 
    String password,
    ) async {
    final url = Uri.parse('${APIConfig.baseURL}signup/');

    Map<String, dynamic> requestBody = {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
    };

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${APIConfig.token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 500) {
      throw Exception('Failed to create user: ${response.body}');
    } else {
      return jsonDecode(response.body);
    }
  }

/*
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = Uri.parse('${APIConfig.baseURL}signin/');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${APIConfig.token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['accessToken']);
      prefs.setString('email', data['email']);
      prefs.setInt('id', data['id']);
      prefs.setStringList('roles', List<String>.from(data['roles']));
      return data;
    } else {
      throw Exception('Failed to sign in');
    }
  }
*/

}