import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voz_app/models/category_model.dart';

class CategoryService {
  static Future<List<CategoryModel>> fetchCategories() async {
    try {
      var url = Uri.parse(
          "https://10.0.2.2:7094/api/Category?pageNumber=1&pageSize=5");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        var result = jsonResponse['data'] as List<dynamic>;
        return result
            .map((category) => CategoryModel.fromJson(category))
            .toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
