import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voz_app/models/thread_model.dart';

class ThreadService {
  static Future<List<ThreadModel>> fetchThreads(int forumId) async {
    try {
      var url = Uri.parse(
          "https://10.0.2.2:7094/api/Thread/ThreadsByForum?id=$forumId&pageNumber=1&pageSize=50");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        var result = jsonResponse['data'] as List<dynamic>;
        return result.map((thread) => ThreadModel.fromJson(thread)).toList();
      } else {
        throw Exception('Failed to load threads');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<ThreadModel> fetchDetailThread(int threadId) async {
    try {
      var url = Uri.parse("https://10.0.2.2:7094/api/Thread/$threadId");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        var result = jsonResponse['data'];
        return ThreadModel.fromJson(result);
      } else {
        throw Exception('Failed to load thread');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
