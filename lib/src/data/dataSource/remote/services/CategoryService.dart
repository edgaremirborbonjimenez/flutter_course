import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/src/data/api/ApiConfig.dart';
import 'package:e_commerce/src/data/dataSource/local/SharedPref.dart';
import 'package:e_commerce/src/domain/models/AuthResponse.dart';
import 'package:e_commerce/src/domain/models/Category.dart';
import 'package:e_commerce/src/domain/utils/ListToString.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class CategoryService {
  SharedPref sharedPref;

  CategoryService(this.sharedPref);

  Future<Resource<Category>> create(Category category, File? file) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/categories');
      String token = "";
      final userSession = await sharedPref.read('user');
      if (userSession != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
      }
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          // Si tu API espera Bearer, usa:
          // 'Authorization': 'Bearer $token',
          'Authorization': token,
        },
        body: jsonEncode({
          'name': category.name,
          'description': category.description,
        }),
      );
      final data = json.decode(response.body);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return Error(listToString(data['message']));
      }
      Category categoryResponse = Category.fromJson(data);
      return Success(categoryResponse);
    } catch (e) {
      print('Error: ${e}');
      return Error(e.toString());
    }
  }
}
