import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycash_front/model/User.dart';
import 'package:mycash_front/services/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  
  static Future<void> signup(
    String first_name,
    String last_name,
    String email, 
    String password,
  ) async {
    final url = Uri.parse('${APIConfig.baseURL}auth/signup');

    Map<String, dynamic> requestBody = {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create user: ${response.body}');
    }
  }


  static Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = Uri.parse('${APIConfig.baseURL}auth/signin');
    final response = await http.post(
      url,
      headers: {
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
      // Log the response for debugging
      print('Error response: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to sign in: ${response.body}');
    }
  }



}