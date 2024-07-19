import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mycash_front/services/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';



class UserService {
    static Future<String> getNewProfileUrl(File image) async {
    final url = Uri.parse('${APIConfig.baseURL}user/profile-picture/');
    print("Calling API: GET $url");
    print("KEY: ${APIConfig.token}");
    var request = http.MultipartRequest("POST", url);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("id")!;
    //request.files.add(http.MultipartFile.fromBytes('profile_picture',image.readAsBytesSync(), contentType: MediaType("image", "jpg"), filename: basename(image.path)));
    request.files.add(http.MultipartFile.fromBytes('profile_picture', await File.fromUri(image.uri).readAsBytes(), contentType: MediaType('image', 'jpeg'),filename: "test.jpg"));

    request.fields['userId']="$id";
    request.headers["Authorization"]='Bearer ${APIConfig.token}';
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
      var obj = json.decode(response.body)["user"];
      //User.fromJson(json.decode(response.body));
      return '${APIConfig.baseURL.replaceAll("/api/", "/")}${obj["profile_picture"]}';
  }else{
    print("API Error: ${response.statusCode} ${response.reasonPhrase} ${response.body}");
    throw Exception('Failed to upload user info');
  }
  }
}