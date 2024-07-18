import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycash_front/model/category.dart';
import 'package:mycash_front/services/api_config.dart';

class CategoryService{
  static Future<List<Category>> fetchCategories() async {
    final url = Uri.parse('${APIConfig.baseURL}categories/');
    print("Calling API: GET $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${ await APIConfig.getToken()}'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print("API Response: ${response.body}");
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to load Category');
    }
  }

  
}