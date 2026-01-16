import 'dart:convert';
import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/domain/utils/ListToString.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce/src/data/api/ApiConfig.dart';
import 'package:e_commerce/src/domain/models/AuthResponse.dart';
import 'package:injectable/injectable.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/auth/login');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode({'email': email, 'password': password});
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return Error(data["message"].toString());
      }
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return Success(authResponse);
    } catch (e) {
      print('Error: ${e}');
      return Error(e.toString());
    }
  }

  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/auth/register');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode(user.toJson());
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return Error(listToString(data['message']));
      }
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return Success(authResponse);
    } catch (e) {
      print('Error: ${e}');
      return Error(e.toString());
    }
  }
}
