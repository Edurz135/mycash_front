import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIConfig {
  static String baseURL = "http://10.0.2.2:3000/api/";
  static String token = "";

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.production:
        baseURL = 'http://18.188.219.121/api/';
        token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE1Nzk2OTkwfQ.Ok9iSckRsnSkUXU9J6MNY519Ml6xYjxnaMipdAbuPN0";
        break;
      case Environment.development:
        baseURL = 'http://10.0.2.2:3000/api/';
        token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE3MTg2MzE3fQ.JeWe0mN26B9GV6nTwnojVs5Yro8RphV6_ryKLSvNM5s";
        break;
    }
  }
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static void setToken(String token) {
    token = token;
  }
}

enum Environment {
  production,
  development,
}