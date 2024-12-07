import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voz_app/models/forum_model.dart';

class ForumService {
  static Future<List<ForumModel>> fetchForums(int categoryId) async {
    try {
      var url = Uri.parse("https://10.0.2.2:7094/api/Forum/$categoryId");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        var result = jsonResponse['data'] as List<dynamic>;
        return result.map((forum) => ForumModel.fromJson(forum)).toList();
      } else {
        throw Exception('Failed to load forums');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
